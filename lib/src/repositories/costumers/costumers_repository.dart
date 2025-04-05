import 'dart:convert';

import 'package:pizzaria/src/domain/entities/costumers_entity.dart';
import 'package:pizzaria/src/service/costumers/costumers_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CostumersRepository implements ICostumersInterface {
  late SharedPreferences _shared;
  final String _key = 'consumers';

  @override
  Future<CostumersModel?> initialize() async {
    _shared = await SharedPreferences.getInstance();
    await firstInit();
    String? data = _shared.getString(_key);
    return CostumersModel.fromJson(jsonDecode(data!));
  }

  @override
  Future<void> firstInit() async {
    if (_shared.get(_key) == null) {
      Map<String, dynamic> costumerList = {
        "costumer": [
          {
            "id": 0,
            "name": "Jantas",
            "adress": "Cantinho da Pizza",
            "phoneNumber": "(61) 9 9980-8449",
            "orders": [
              {
                "flavor": ["Port", "Calabresa"],
                "date": "20/10",
                "app": false,
                "amount": 55.00
              }
            ]
          },
        ]
      };
      await _shared.setString(_key, jsonEncode(costumerList));
    }
  }

  @override
  Future<void> updateData(CostumersModel costumerList) async {
    await _shared.setString(_key, jsonEncode(costumerList));
  }
}
