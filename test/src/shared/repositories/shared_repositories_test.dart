import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/src/shared/models/costumers_model.dart';
import 'package:pizzaria/src/shared/models/orders_model.dart';
import 'package:pizzaria/src/shared/repositories/shared_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedRepositories db;

  var json = {
    "costumer": [
      {
        "id": 0,
        "name": "Jantas",
        "adress": "Cantinho da Pizza",
        "phoneNumber": "61 999808449",
        "orders": [
          {
            "flavor": ["Port", "Calabresa"],
            "date": "20/10",
            "price": "55,00",
            "app": false,
          }
        ]
      },
    ]
  };

  setUp(() async {
    SharedPreferences.setMockInitialValues(json);
    db = SharedRepositories();
  });
  group("Shared Preferences", () {
    test("Instance Costumer", () async {
      var init = await db.initialize();
      expect(init, isInstanceOf<CostumersModel>());
    });

    test("Initialize == json", () async {
      var init = await db.initialize();
      var costumer = init!.toJson();
      expect(costumer, json);
    });

    test("Initialize != json", () async {
      var newCostumer = Costumer(
        id: 1,
        name: "Test",
        adress: "Test",
        phoneNumber: "Test",
        orders: [
          Order(flavor: ["Mussa"], date: "20/10", app: true, price: "55")
        ],
      );
      var init = await db.initialize();
      init!.costumer.add(newCostumer);
      db.updateData(init);
      var result = init.toJson();

      expect(true, result != json);
    });
    test("Update Data", () async {
      var newCostumer = Costumer(
        id: 1,
        name: "Test",
        adress: "Test",
        phoneNumber: "Test",
        orders: [
          Order(flavor: ["Mussa"], date: "20/10", app: true, price: "55")
        ],
      );
      var init = await db.initialize();
      init!.costumer.add(newCostumer);
      db.updateData(init);
      expect(init.costumer.length == 2, true);
    });
  });
}
