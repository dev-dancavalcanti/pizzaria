import 'package:flutter/material.dart';
import 'package:pizzaria/src/domain/entities/costumers_entity.dart';
import 'package:pizzaria/src/domain/entities/orders_entity.dart';

import '../../service/costumers/costumers_interface.dart';

class CostumersController extends ChangeNotifier {
  final ICostumersInterface _db;
  CostumersController(this._db) {
    init();
  }

  CostumersModel? listCostumers;
  CostumersModel? _cachedCostumers;

  List<String> listFlavor = [];

  bool isRegister = true;
  bool isLoading = false;
  bool isVisible = false;
  bool ifood = false;
  bool reverseList = false;
  bool size = true;

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController flavor = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();

  int? index;

  /// Verify if is register
  Future<void> toggleRegister() async {
    isRegister = !isRegister;
    notifyListeners();
  }

  /// Verify if is loading
  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  toggleApp() {
    ifood = !ifood;
    notifyListeners();
  }

  /// Init Costumers Service
  Future<void> init() async {
    await toggleLoading();
    listCostumers = await _db.initialize();
    _cachedCostumers = listCostumers;
    filterDefault();
    await toggleLoading();
  }

  /// This function checks whether it will save a new consumer or save an order from an existing consumer
  Future<void> saveOrderOrCostumer(
      {required String name,
      required String phoneNumber,
      required String adress,
      required String date,
      required List<String> listFlavors,
      required bool app,
      required double amount}) async {
    bool saveCostumer = true;

    for (var i = 0; i < listCostumers!.costumer.length; ++i) {
      if (name.toLowerCase() ==
          listCostumers!.costumer[i].name!.toLowerCase()) {
        saveCostumer = false;
        return saveOrder(
            listFlavors: [...listFlavors],
            date: date,
            index: i,
            app: app,
            amount: amount);
      }
    }
    if (saveCostumer) {
      return saveNewCostumer(
          name: name,
          phoneNumber: phoneNumber,
          adress: adress,
          listFlavors: [...listFlavors],
          date: date,
          app: app,
          amount: amount);
    }
  }

  /// The function must add an existing consumer order
  Future<void> saveNewCostumer(
      {required String name,
      required String phoneNumber,
      required String adress,
      required List<String> listFlavors,
      required String date,
      required bool app,
      required double amount}) async {
    var value = listCostumers!.costumer.length;

    listCostumers!.costumer.add(Costumer(
      id: value,
      name: name,
      phoneNumber: phoneNumber,
      adress: adress,
      orders: [
        Order(
            flavor: ["Calab"],
            date: "20/10",
            amount: 55,
            adress: '',
            history: Historic(history: {
              '0': {
                "status": "Aguardando",
                "time": DateTime.now(),
              }
            }))
      ],
    ));
    _db.updateData(listCostumers!);
    isVisible = false;
    clearText();

    notifyListeners();
  }

  /// The function must add an existing consumer order
  Future<void> saveOrder(
      {required List<String> listFlavors,
      required String date,
      required int index,
      required bool app,
      required double amount}) async {
    if (listCostumers!.costumer[index].phoneNumber!.isEmpty &&
        phoneNumber.text.isNotEmpty) {
      listCostumers!.costumer[index].phoneNumber = phoneNumber.text;
    }
    listCostumers!.costumer[index].orders!.add(Order(
        flavor: ["Calab"],
        date: "20/10",
        amount: 55,
        adress: '',
        history: Historic(history: {
          '0': {
            "status": "Aguardando",
            "time": DateTime.now(),
          }
        })));
    _db.updateData(listCostumers!);
    isVisible = false;
    clearText();

    notifyListeners();
  }

  /// Check if the customer is already registered; if so, add the number and address to the record for order pickup.
  Future<void> checkCostumer({required String name}) async {
    for (var i = 0; i < listCostumers!.costumer.length; ++i) {
      if (name.toLowerCase() !=
          listCostumers!.costumer[i].name!.toLowerCase()) {
        phoneNumber.text = listCostumers!.costumer[i].phoneNumber!;
        adress.text = listCostumers!.costumer[i].adress!;
        index = i;
      }
      index = null;
      phoneNumber.clear();
      adress.clear();
    }

    notifyListeners();
  }

  /// Shearching costumer
  Future<void> searchCostumer({required String text}) async {
    _cachedCostumers =
        listCostumers!.copyWith(costumer: _cachedCostumers!.costumer);
    List<Costumer> list = _cachedCostumers!.costumer
        .where(
          (e) => e.name.toString().toLowerCase().contains(text.toLowerCase()),
        )
        .toList();

    if (list.isEmpty) {
      list = _cachedCostumers!.costumer
          .where(
            (e) => e.phoneNumber
                .toString()
                .replaceAll(' ', '')
                .replaceAll('(', '')
                .replaceAll(')', '')
                .replaceAll('-', '')
                .toLowerCase()
                .contains(text.toLowerCase().replaceAll(' ', '')),
          )
          .toList();
      listCostumers = listCostumers!.copyWith(costumer: list);
    }
    listCostumers = listCostumers!.copyWith(costumer: list);
    notifyListeners();
  }

  /// Remove Order of costumers
  Future<void> removeOrder(
      {required int indexCostumer, required int indexOrder}) async {
    listCostumers!.costumer[indexCostumer].orders!.removeAt(indexOrder);
    _db.updateData(listCostumers!);
    _cachedCostumers = listCostumers;
    notifyListeners();
  }

  /// Add pizza of list flavors in register
  Future<void> addPizza() async {
    if (flavor.text.isNotEmpty) {
      isVisible = true;
      listFlavor.add(flavor.text);
      flavor.clear();
      listFlavor;
    }
    notifyListeners();
  }

  /// Remove pizza of list flavors in register
  Future<void> removePizza({required int index}) async {
    listFlavor.removeAt(index);
    if (listFlavor.isEmpty) {
      isVisible = false;
    }

    notifyListeners();
  }

  /// Count all pizzas in customer orders
  String counterPizzas(
    int index,
  ) {
    List orders = [];

    for (var i = 0; i < listCostumers!.costumer[index].orders!.length; i++) {
      orders.add(listCostumers!.costumer[index].orders![i].flavor!.length);
    }
    final pizzas = orders.reduce((value, element) {
      return value + element;
    });
    return pizzas.toString();
  }

  /// Check is ifood order
  checkIfood() {
    ifood = !ifood;
    notifyListeners();
  }

  /// Delete costumer
  Future<void> removeCostumer({required int index}) async {
    listCostumers!.costumer.removeAt(index);
    _db.updateData(listCostumers!);
    _cachedCostumers = listCostumers;
    this.index = null;
    notifyListeners();
  }

  /// Filters
  /// The list of customers in alphabetical order
  Future<void> filterOrderAlphabetical() async {
    listCostumers!.costumer.sort((a, b) {
      int compare = a.name!.compareTo(b.name!);
      if (compare != 0) {
        return compare;
      }

      return a.id!.compareTo(b.id!);
    });

    notifyListeners();
  }

  Future<void> filterDefault() async {
    listCostumers!.costumer.sort((a, b) {
      int compare = a.id!.compareTo(b.id!);
      if (compare != 0) {
        return compare;
      }
      return compare;
    });

    notifyListeners();
  }

  Future<void> filterCash() async {
    listCostumers!.costumer.sort((a, b) {
      double compareA =
          a.orders!.fold(0, (sum, order) => sum! + order.amount!) ?? 0;
      double compareB =
          b.orders!.fold(0, (sum, order) => sum! + order.amount!) ?? 0;
      return compareB.compareTo(compareA);
    });

    notifyListeners();
  }

  Future<void> filterPizzas() async {
    listCostumers!.costumer.sort((a, b) {
      double compareA =
          a.orders!.fold(0, (sum, order) => sum! + order.flavor!.length) ?? 0;
      double compareB =
          b.orders!.fold(0, (sum, order) => sum! + order.flavor!.length) ?? 0;
      int result = compareB.compareTo(compareA);

      if (result != 0) {
        return result;
      }

      double comparePriceA =
          a.orders!.fold(0, (sum, order) => sum! + order.amount!) ?? 0;
      double comparePriceB =
          b.orders!.fold(0, (sum, order) => sum! + order.amount!) ?? 0;
      return comparePriceB.compareTo(comparePriceA);
    });
    notifyListeners();
  }

  /// Clear all TextEditController when save costumer or order
  clearText() {
    adress.clear();
    date.clear();
    name.clear();
    flavor.clear();
    phoneNumber.clear();
    listFlavor.clear();
    amount.clear();
    notifyListeners();
  }
}
