import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/src/domain/entities/costumers_entity.dart';
import 'package:pizzaria/src/domain/entities/orders_entity.dart';

void main() {
  group("Order Model", () {
    var json = Order(
        flavor: ["Calab"],
        date: "20/10",
        amount: 55,
        adress: '',
        history: Historic(history: {
          '0': {
            "status": "Aguardando",
            "time": DateTime.now(),
          }
        }));

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
                "amount": "55"
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
