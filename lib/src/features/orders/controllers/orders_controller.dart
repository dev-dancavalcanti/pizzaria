import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/features/costumers/controllers/costumers_controller.dart';

class OrdersController extends ChangeNotifier {
  final CostumersController _controller;
  OrdersController(this._controller);

  String? nameQuery;
  bool? visibleProducao;
  String? lengthProd;

  void changeQuery(String value) {
    nameQuery = value;
    notifyListeners();
  }

  void verifyLenght(String queryName) async {
    final query = FirebaseDatabase.instance.ref(queryName);
    var data = await query.once();
    lengthProd = data.snapshot.children.length.toString();
  }

  Future<void> changeQueryOrder({required DataSnapshot snapshot}) async {
    FirebaseDatabase init = FirebaseDatabase.instance;
    DatabaseReference query = init.ref('orders');

    Map<String, dynamic> orderData =
        Map<String, dynamic>.from(snapshot.value as Map);
    var orderHistory = orderData["history"];

    if (orderHistory.last["status"] == "Aguardando") {
      query.child("${snapshot.key}").child("history").update({
        "1": {"status": "Em Produção", "time": DateTime.now().toString()}
      });
    }
    if (orderHistory.last["status"] == "Em Produção") {
      query.child("${snapshot.key}").child("history").update({
        "2": {"status": "Em Rota", "time": DateTime.now().toString()}
      });
    }
    if (orderHistory.last["status"] == "Em Rota") {
      query.child("${snapshot.key}").child("history").update({
        "3": {"status": "Concluído", "time": DateTime.now().toString()}
      });
    }
  }
}
