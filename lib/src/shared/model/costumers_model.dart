import 'package:pizzaria/src/shared/model/orders_model.dart';

class CostumersModel {
  late List<Costumer> costumer;

  CostumersModel({
    required this.costumer,
  });

  CostumersModel.fromJson(Map<String, dynamic> json) {
    if (json['costumer'] != null) {
      costumer = <Costumer>[];
      json['costumer'].forEach((v) {
        costumer.add(Costumer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['costumer'] = costumer.map((v) => v.toJson()).toList();
    return data;
  }

  CostumersModel copyWith({
    List<Costumer>? costumer,
  }) {
    return CostumersModel(
      costumer: costumer ?? this.costumer,
    );
  }
}

class Costumer {
  String? id;
  String? name;
  String? adress;
  String? phoneNumber;
  List<Order>? orders;

  Costumer(
      {required this.id,
      required this.name,
      required this.adress,
      required this.phoneNumber,
      required this.orders});

  Costumer.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['adress'] = adress;
    data['phoneNumber'] = phoneNumber;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
