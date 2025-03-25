import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pizzaria/src/features/costumers/controllers/costumers_controller.dart';
import 'package:pizzaria/src/shared/models/costumers_model.dart';
import 'package:pizzaria/src/shared/services/costumers_interface.dart';

import 'costumers_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ICostumersInterface>()])
void main() {
  late CostumersController controller;
  late MockICostumersInterface db;

  CostumersModel json = CostumersModel.fromJson({
    "costumer": [
      {
        "id": 0,
        "name": "Daniel",
        "adress": "Rua Travessa do Abreu",
        "phoneNumber": "61 999808449",
        "orders": [
          {
            "flavor": ["Port", "Calabresa"],
            "date": "20/10",
            "app": true,
            "price": "110"
          }
        ]
      },
      {
        "name": "Jessica",
        "adress": "Rua Travessa do AAbreu",
        "phoneNumber": "61 99999999",
        "orders": [
          {
            "flavor": ["Port", "Calabresa", "Banana Nevada"],
            "date": "20/10"
          }
        ]
      }
    ]
  });

  setUp(() {
    db = MockICostumersInterface();
    controller = CostumersController(db);
    when(db.initialize()).thenAnswer((_) async => json);
    controller.listCostumers = json;
    controller.init();
  });

  group("Test Costumer Controller", () {
    test(
      'init the list of costumers',
      () async {
        expect(controller.listCostumers, json);
      },
    );
    test('The function must add an existing consumer order ', () async {
      await controller.saveOrderOrCostumer(
        price: 53,
        app: true,
        name: 'Daniel',
        phoneNumber: '',
        adress: "Rua Travessa do Abreu",
        listFlavors: ["Calab"],
        date: "31/10",
      );

      expect(controller.listCostumers!.costumer[0].orders!.length, 2);
    });
    test('The function must create a new consumer', () {
      controller.saveOrderOrCostumer(
          price: 53,
          app: false,
          name: 'Joao',
          phoneNumber: '230203',
          adress: 'Rua Travessa do Treu',
          date: '20/10',
          listFlavors: ['Manjericao', 'Frango com Cat']);
      expect(controller.listCostumers!.costumer.length, 3);
    });
    test('The function must add pizza in the list for add new order', () async {
      controller.flavor.text = 'Calabresa';
      await controller.addPizza();
      controller.flavor.text = 'Marguerita';
      await controller.addPizza();
      controller.flavor.text = 'Chocolate';
      await controller.addPizza();

      controller.saveOrderOrCostumer(
          price: 53,
          app: false,
          name: 'Jessica',
          phoneNumber: '61 999808449',
          adress: 'Rua Travessa do AaaBreu',
          date: '20/10',
          listFlavors: controller.listFlavor);

      expect(
          controller.listCostumers!.costumer[1].orders![1].flavor!.length, 3);
    });
    test('The funcrtion calculate pizzar of costumers', () {
      controller.counterPizzas(0);
      expect(2, 2);
    });

    test("Check costumers is already registered", () async {
      controller.checkCostumer(name: 'Daniel');
      var result = controller.adress.text;
      expect(result == 'Rua Travessa do Abreu', true);
    });
    test("Add pizz in list flavors", () {
      controller.flavor.text = 'Calabresa';
      controller.addPizza();
      expect(controller.listFlavor.length == 1, true);
    });
    test("Remove pizza in list flavor", () {
      controller.flavor.text = 'Marg';
      controller.addPizza();

      /// listFlavors == 1;
      controller.removePizza(index: 0);

      /// listFlavors == 0;

      expect(controller.listFlavor.length = 0, 0);
    });
    test("Search Costumer in List Costumers", () {
      ///Search costumer for name.
      controller.searchCostumer(text: 'Daniel');
      expect(controller.listCostumers!.costumer.length, 1);
    });

    test(
        "Search Costumer in List Costumers, but now go search costumers not existing",
        () {
      controller.searchCostumer(text: 'Lucas');
      expect(controller.listCostumers!.costumer.length, 0);
    });

    test("Search costumer for phone number", () {
      controller.searchCostumer(text: "6 1 999 99 99 9");
      expect(controller.listCostumers!.costumer.length, 1);
    });
  });
}
