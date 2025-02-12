import 'package:flutter/material.dart';
import '../../../shared/models/costumers_model.dart';
import '../../../shared/models/orders_model.dart';
import '../../../shared/services/costumers_interface.dart';

class CostumersController extends ChangeNotifier {
  final ICostumersInterface _db;
  CostumersController(this._db) {
    init();
  }

  CostumersModel? listCostumers;
  CostumersModel? _cachedCostumers;

  List<String> listFlavor = [];

  bool isLoading = false;
  bool isVisible = false;

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController flavor = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController price = TextEditingController();

  /// Verify if is loading
  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  /// Init Costumers Service
  Future<void> init() async {
    await toggleLoading();
    listCostumers = await _db.initialize();
    _cachedCostumers = listCostumers;
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
      required String price}) async {
    bool saveCostumer = true;
    for (var i = 0; i < listCostumers!.costumer.length; ++i) {
      if (name == listCostumers!.costumer[i].name) {
        saveCostumer = false;
        return saveOrder(
            listFlavors: [...listFlavors],
            date: date,
            index: i,
            app: app,
            price: price);
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
          price: price);
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
      required String price}) async {
    var value = listCostumers!.costumer.length;

    listCostumers!.costumer.add(Costumer(
      id: value,
      name: name,
      phoneNumber: phoneNumber,
      adress: adress,
      orders: [
        Order(flavor: listFlavors, date: date, app: app, price: price),
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
      required String price}) async {
    listCostumers!.costumer[index].orders!
        .add(Order(flavor: listFlavors, date: date, app: app, price: price));
    _db.updateData(listCostumers!);
    isVisible = false;
    clearText();

    notifyListeners();
  }

  /// Check if the customer is already registered; if so, add the number and address to the record for order pickup.
  Future<void> checkCostumer({required String name}) async {
    for (var i = 0; i < listCostumers!.costumer.length; ++i) {
      if (name.toLowerCase() ==
          listCostumers!.costumer[i].name!.toLowerCase()) {
        phoneNumber.text = listCostumers!.costumer[i].phoneNumber!;
        adress.text = listCostumers!.costumer[i].adress!;
        date.text = DateTime.now().day.toString();
        return;
      } else {
        phoneNumber.clear();
        adress.clear();
      }
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
                .toLowerCase()
                .contains(text.toLowerCase().replaceAll(' ', '')),
          )
          .toList();
      listCostumers = listCostumers!.copyWith(costumer: list);
    } else {
      listCostumers = listCostumers!.copyWith(costumer: list);
    }

    notifyListeners();
  }

  /// Remove Order of costumers
  Future<void> removeOrder(
      {required int indexCostumer, required int indexOrder}) async {
    listCostumers!.costumer[indexCostumer].orders!.removeAt(indexOrder);
    _db.updateData(listCostumers!);

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
  String counterPizzas(int index) {
    List orders = [];

    for (var i = 0; i < listCostumers!.costumer[index].orders!.length; i++) {
      orders.add(listCostumers!.costumer[index].orders![i].flavor!.length);
    }
    final pizzas = orders.reduce((value, element) {
      return value + element;
    });
    return pizzas.toString();
  }

  /// Clear all TextEditController when save costumer or order
  clearText() {
    adress.clear();
    date.clear();
    name.clear();
    flavor.clear();
    phoneNumber.clear();
    listFlavor.clear();
    price.clear();
    notifyListeners();
  }
}
