import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_controller.dart';
import 'package:pizzaria/src/shared/utils/components/list_orders.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/orders_model.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final query = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final OrdersController controller = context.watch<OrdersController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
            ChangeNotifierProvider.value(
              value: controller,
              child: Column(
                children: [
                  ListOrders(
                      query: query.ref('Aguardando'),
                      nameQuery: 'Aguardando',
                      function: () {
                        controller.changeQueryOrder(
                            queryAddOrder: 'Em producao',
                            queryOrderRemove: 'Aguardando',
                            order: Order(
                                    flavor: ['Calabresa'],
                                    date:
                                        '${DateTime.now().day}/${DateTime.now().month}',
                                    app: false,
                                    price: 55.0)
                                .toJson());
                      }),
                  ListOrders(
                      query: query.ref('Em producao'),
                      nameQuery: 'Em producao',
                      function: () {
                        controller.changeQueryOrder(
                            queryAddOrder: 'Em Rota',
                            queryOrderRemove: 'Em producao',
                            order: Order(
                                    flavor: ['Calabresa'],
                                    date:
                                        '${DateTime.now().day}/${DateTime.now().month}',
                                    app: false,
                                    price: 55.0)
                                .toJson());
                      }),
                  ListOrders(
                      query: query.ref('Em Rota'),
                      nameQuery: 'Em Rota',
                      function: () {
                        controller.changeQueryOrder(
                            queryAddOrder: 'Concluido',
                            queryOrderRemove: 'Em Rota',
                            order: Order(
                                    flavor: ['Calabresa'],
                                    date:
                                        '${DateTime.now().day}/${DateTime.now().month}',
                                    app: false,
                                    price: 55.0)
                                .toJson());
                      }),
                  ListOrders(
                      query: query.ref('Concluido'),
                      nameQuery: 'Concluido',
                      function: () {
                        controller.changeQueryOrder(
                            queryAddOrder: 'Aguardando',
                            queryOrderRemove: 'Concluido',
                            order: Order(
                                    flavor: ['Calabresa'],
                                    date:
                                        '${DateTime.now().day}/${DateTime.now().month}',
                                    app: false,
                                    price: 55.0)
                                .toJson());
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
