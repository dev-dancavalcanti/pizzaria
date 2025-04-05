import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/src/domain/entities/costumers_entity.dart';

void main() {
  group('Costumers Model', () {
    var json = CostumersModel.fromJson({
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
        {
          "name": "Jessica",
          "adress": "Rua Travessa do Abreu",
          "numberPhone": "61 999808449",
          "orders": [
            {
              "flavor": ["Port", "Calabresa", "Banana Nevada"],
              "date": "20/10",
              "app": false,
              "amount": "55"
            }
          ]
        }
      ]
    });
    test("Instance Costumers Model", () {
      expect(json, isInstanceOf<CostumersModel>());
    });

    test("Name costumer is correct ?", () {
      bool verify = false;
      if (json.costumer[0].name == 'Daniel') {
        return !verify;
      } else {
        verify;
      }

      expect(verify, true);
    });
  });
}
