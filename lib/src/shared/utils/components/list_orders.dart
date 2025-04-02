// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_controller.dart';
import 'package:pizzaria/src/features/orders/screens/order_detail_page.dart';

class ListOrders extends StatefulWidget {
  final Query query;
  final String nameQuery;
  final OrdersController controller;
  final String lengthQuery;
  const ListOrders(
      {super.key,
      required this.query,
      required this.nameQuery,
      required this.controller,
      required this.lengthQuery});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: FirebaseAnimatedList(
            shrinkWrap: true,
            query: widget.query,
            itemBuilder: (context, snapshot, animation, index) {
              if (snapshot.value == null) {
                return const Center(
                  child: Text("Nao tem pedidos no momento."),
                );
              }

              Map<String, dynamic> orderData =
                  Map<String, dynamic>.from(snapshot.value as Map);
              var history = orderData['history'];

              if (history.last['status'] != widget.nameQuery) {
                return const Center(
                  child: Text('data'),
                );
              }
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderDetailPage()));
                  // widget.controller.changeQueryOrder(
                  //   snapshot: snapshot,
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("${orderData['order']['price']}"),
                        Text(orderData['order']['name']),
                        Text(orderData['order']['adress'])
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
