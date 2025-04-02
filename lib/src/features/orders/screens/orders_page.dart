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
                      setState(() {
                        controller.select = 0;
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Aguardando',
                          style: TextStyle(
                              fontWeight: controller.select == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Em Produção");
                      setState(() {
                        controller.select = 1;
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Em Produção',
                          style: TextStyle(
                              fontWeight: controller.select == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Em Rota");
                      setState(() {
                        controller.select = 2;
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Em Rota',
                          style: TextStyle(
                              fontWeight: controller.select == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeQuery("Concluído");
                      setState(() {
                        controller.select = 3;
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Concluído',
                          style: TextStyle(
                              fontWeight: controller.select == 3
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
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
                    nameQuery: controller.nameQuery ?? 'Aguardando',
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
