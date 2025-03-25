import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/utils/widgets/icon_button.dart';
import 'package:provider/provider.dart';

import '../../../features/costumers/controllers/costumers_controller.dart';

class FilterBox extends StatefulWidget {
  final CostumersController controller;
  const FilterBox({super.key, required this.controller});

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation sizeAnimation;
  late bool boolAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    sizeAnimation = Tween<double>(begin: 0.0, end: .2).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 1)));
    boolAnimation = false;

    super.initState();
    _animationController.forward();
    _animationController.addListener(
      () {
        setState(() {
          if (_animationController.isCompleted && mounted) {
            boolAnimation = true;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CostumersController controller = context.watch<CostumersController>();
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 226, 229, 231),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      insetPadding: const EdgeInsets.all(0),
      alignment: Alignment.bottomCenter,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * sizeAnimation.value,
        width: MediaQuery.of(context).size.width,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: !boolAnimation ? 0 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      icon: Icons.unfold_more_outlined,
                      text: 'Padrão',
                      function: () {
                        controller.filterDefault();

                        Navigator.of(context).pop();
                      }),
                  MyButton(
                      function: () {
                        controller.filterOrderAlphabetical();
                        Navigator.of(context).pop();
                      },
                      text: 'Alfabética',
                      icon: Icons.abc_outlined),
                  MyButton(
                      function: () {
                        controller.filterCash();
                        Navigator.of(context).pop();
                      },
                      text: 'Valor Gasto',
                      icon: Icons.attach_money_outlined),
                  MyButton(
                      function: () {
                        controller.filterPizzas();
                        Navigator.of(context).pop();
                      },
                      text: 'Quant Pedidos',
                      icon: Icons.border_color_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
