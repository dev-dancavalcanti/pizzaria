import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/utils/components/list_orders.dart';
import '../controllers/orders_controller.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref("orders");

  @override
  Widget build(BuildContext context) {
    final OrdersController controller = context.watch<OrdersController>();

    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Aguardando");
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Aguardando'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Em Produção");
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Em Produção'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Em Rota");
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Em Rota'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Concluído");
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Concluído'),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ListOrders(
                    lengthQuery: controller.lengthProd.toString(),
                    query: _ref,
                    nameQuery: controller.nameQuery ?? '',
                    controller: controller,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
