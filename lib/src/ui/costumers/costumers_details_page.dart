import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../../viewmodel/costumers/costumers_viewmodel.dart';

class ConstumersDetails extends StatelessWidget {
  final int index;
  const ConstumersDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final CostumersController controller = context.watch<CostumersController>();
    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 40,
                            child: Text(
                              controller.listCostumers!.costumer[index].name!
                                  .split('')
                                  .first,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.listCostumers!.costumer[index].name!,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(controller
                              .listCostumers!.costumer[index].adress!),
                          Text(controller
                              .listCostumers!.costumer[index].phoneNumber!),
                          Row(
                            children: [
                              Text(
                                  'Pedidos:  ${controller.listCostumers!.costumer[index].orders!.isEmpty ? 0 : controller.listCostumers!.costumer[index].orders!.length}'),
                              const Spacer(),
                              Text(
                                  'Pizzas:  ${controller.listCostumers!.costumer[index].orders!.isEmpty ? 0 : controller.counterPizzas(index)}'),
                            ],
                          ),
                          const Text('Valor Gasto: ')
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Text(
                'Pedidos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            if (controller.listCostumers!.costumer[index].orders!.isNotEmpty)
              Column(
                children: [
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      itemCount: controller
                          .listCostumers!.costumer[index].orders?.length,
                      itemBuilder: (context, numas) {
                        return GestureDetector(
                          onLongPress: () {
                            controller.removeOrder(
                                indexCostumer: index, indexOrder: numas);
                          },
                          child: Card(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Positioned(
                                  bottom: -25,
                                  right: 0,
                                  child: controller.listCostumers!
                                          .costumer[index].phoneNumber!.isEmpty
                                      ? SvgPicture.asset(
                                          'assets/svg/ifood.svg',
                                          height: 100,
                                        )
                                      : SvgPicture.asset(
                                          'assets/svg/wpp.svg',
                                          height: 100,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(),
                                          Center(
                                            child: Text(
                                              controller
                                                  .listCostumers!
                                                  .costumer[index]
                                                  .orders![numas]
                                                  .date!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            padding: const EdgeInsets.all(0),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .listCostumers!
                                                .costumer[index]
                                                .orders![numas]
                                                .flavor!
                                                .length,
                                            itemBuilder: (context, i) {
                                              return Text(controller
                                                  .listCostumers!
                                                  .costumer[index]
                                                  .orders![numas]
                                                  .flavor![i]);
                                            }),
                                      ),
                                      Text(
                                          'R\$ ${controller.listCostumers!.costumer[index].orders![numas].amount!}0')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              )
            else
              const Expanded(
                  child:
                      Center(child: Text('Não tem nenhum pedido no momento'))),
          ],
        ),
      ),
    );
  }
}
