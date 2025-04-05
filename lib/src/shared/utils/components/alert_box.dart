import 'package:flutter/material.dart';

import '../../../viewmodel/costumers/costumers_viewmodel.dart';

class AlertBox extends StatelessWidget {
  final int i;
  final CostumersController controller;
  final String name;
  const AlertBox(
      {super.key,
      required this.i,
      required this.controller,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Deseja deletar o cliente'),
          Text('$name ?',
              style: const TextStyle(fontFamily: 'Urbanist', fontSize: 28)),
        ],
      ),
      scrollable: true,
      backgroundColor: Colors.white,
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.removeCostumer(index: i);
                Navigator.of(context).pop();
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black),
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Deletar',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Text('Voltar', textAlign: TextAlign.center)),
            )
          ],
        ),
      ),
    );
  }
}
