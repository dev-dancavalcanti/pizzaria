import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/features/costumers/controllers/costumers_controller.dart';

class OrdersController extends ChangeNotifier {
  final CostumersController _controller;
  OrdersController(this._controller) {
    refresh();
  }
  bool? visibleProducao;
  int? lengthProd;

  refresh() async {
    await verifyLenght();
  }

  Future<void> verifyLenght() async {
    final query = FirebaseDatabase.instance.ref('Concluido');
    var data = await query.once();
    lengthProd = data.snapshot.children.length;
  }

  Future<void> changeQueryOrder(
      {required String queryAddOrder,
      required String queryOrderRemove,
      required Map order}) async {
    FirebaseDatabase query = FirebaseDatabase.instance;
    if (queryOrderRemove == 'Concluido') {
      // _controller.saveOrder(
      //     listFlavors: listFlavors,
      //     date: date,
      //     index: index,
      //     app: app,
      //     price: price);
    }
    query
        .ref(queryAddOrder)
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .set(order);
    query.ref(queryOrderRemove).remove();
  }
}
