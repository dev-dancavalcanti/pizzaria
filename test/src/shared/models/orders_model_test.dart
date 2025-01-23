import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/src/shared/models/costumers_model.dart';
import 'package:pizzaria/src/shared/models/orders_model.dart';

void main() {
  group("Order Model", () {
    var json = Order(flavor: ["Calab"], date: "20/10", app: true, price: "55");

    test("Instance Order Model", () {
      expect(json, isInstanceOf<Order>());
    });
    test("Add Flavor", () {
      json.flavor!.add("Port");

      expect(json.flavor!.length, 2);
    });

    test("Add Order", () {
      var client = CostumersModel.fromJson({
        "costumer": [
          {
            "name": "Daniel",
            "adress": "Rua Travessa do Abreu",
            "numberPhone": "61 999808449",
            "orders": [
              {
                "flavor": ["Port", "Calabresa"],
                "date": "20/10",
                "app": true,
                "price": "55"
              }
            ]
          },
        ]
      });

      client.costumer[0].orders!.add(json);

      expect(client.costumer[0].orders!.length, 2);
    });
  });
}
