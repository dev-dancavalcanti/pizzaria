import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:pizzaria/src/shared/extension/validate_extension.dart';
import 'package:pizzaria/src/viewmodel/costumers/costumers_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../shared/utils/components/custom_text_field.dart';
import 'costumers_sucess_register.dart';

class CostumersSignUp extends StatefulWidget {
  const CostumersSignUp({super.key});

  @override
  State<CostumersSignUp> createState() => _CostumersSignUpState();
}

class _CostumersSignUpState extends State<CostumersSignUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _opacityRegisterAnimation;
  late GlobalKey<FormState> firstFormKey;
  late GlobalKey<FormState> secondFormKey;

  String text = 'Avançar';

  @override
  void initState() {
    super.initState();
    firstFormKey = GlobalKey<FormState>();
    secondFormKey = GlobalKey<FormState>();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _opacityRegisterAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0, 1, curve: Curves.bounceIn)));

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CostumersController controller = context.watch<CostumersController>();

    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: controller,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Lottie.asset(
                    'assets/lottie/order.json',
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  height: controller.size
                      ? MediaQuery.of(context).size.height / 2.4
                      : MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Opacity(
                          opacity: _opacityRegisterAnimation.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    width: controller.isRegister ? 20 : 10,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    width: !controller.isRegister ? 20 : 10,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              AnimatedCrossFade(
                                  firstChild: Form(
                                    key: firstFormKey,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: Text(
                                            'Cadastre o Cliente',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),

                                        /// TextField = NAME
                                        CustomTextField(
                                          enable: !controller.isLoading,
                                          controller: controller.name,
                                          text: 'nome',
                                          validator: (p0) {
                                            if (p0!.isEmpty || p0 == '') {
                                              return 'Campo Obrigatorio';
                                            }
                                            return null;
                                          },
                                          function: (value) {
                                            controller.checkCostumer(
                                              name: value,
                                            );
                                          },
                                        ),

                                        /// TextFiel = Celular
                                        CustomTextField(
                                          enable: !controller.isLoading,
                                          controller: controller.phoneNumber,
                                          text: 'celular',
                                          validator: (value) =>
                                              value?.validatePhoneNumber(),
                                          inputFormatters: [
                                            MaskInputFormatter(
                                                mask: '(##) # ####-####'),
                                            FilteringTextInputFormatter.deny(
                                                RegExp('[a-zA-Z]'))
                                          ],
                                        ),

                                        /// TextField = Endereco
                                        CustomTextField(
                                            enable: !controller.isLoading,
                                            controller: controller.adress,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Campo Obrigatório";
                                              }

                                              return null;
                                            },
                                            text: 'endereço'),
                                      ],
                                    ),
                                  ),
                                  secondChild: Form(
                                    key: secondFormKey,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            'Registre o Pedido',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: controller.index == null
                                              ? const Text('Legal cliente novo')
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child:
                                                          LottieBuilder.asset(
                                                        'assets/lottie/fire.json',
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                        'O ${controller.listCostumers!.costumer[controller.index!].orders!.length + 1} pedido do cliente na loja!'),
                                                  ],
                                                ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                  value: false,
                                                  groupValue: controller.ifood,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      controller.ifood =
                                                          !controller.ifood;
                                                    });
                                                  },
                                                ),
                                                const Text('Whatsapp'),
                                                Radio(
                                                  value: true,
                                                  groupValue: controller.ifood,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      controller.ifood = value!;
                                                    });
                                                  },
                                                ),
                                                const Text('Ifood')
                                              ],
                                            )
                                          ],
                                        ),

                                        /// TextFiel = Sabores
                                        CustomTextField(
                                          enable: !controller.isLoading,
                                          icon: IconButton(
                                              onPressed: () {
                                                controller.addPizza();
                                              },
                                              icon: const Icon(Icons.add)),
                                          controller: controller.flavor,
                                          text: 'sabores',
                                          validator: (value) {
                                            if (value!.isEmpty &&
                                                    controller
                                                        .listFlavor.isEmpty ||
                                                value == '' &&
                                                    controller
                                                        .listFlavor.isEmpty) {
                                              return "Campo Obrigatório";
                                            }
                                            return null;
                                          },
                                        ),
                                        Visibility(
                                          visible: controller.isVisible,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: controller
                                                    .listFlavor.length,
                                                itemBuilder: (context, index) {
                                                  return Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      GestureDetector(
                                                        onLongPress: () {
                                                          controller
                                                              .removePizza(
                                                                  index: index);
                                                        },
                                                        child: Card(
                                                            child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Text(controller
                                                                    .listFlavor[
                                                                index]),
                                                          ),
                                                        )),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),

                                        /// TextField = Data
                                        CustomTextField(
                                          enable: !controller.isLoading,
                                          controller: controller.date,
                                          text: 'data',
                                          inputFormatters: [
                                            MaskInputFormatter(mask: '##/##'),
                                            FilteringTextInputFormatter.deny(
                                                RegExp('[a-zA-Z]'))
                                          ],
                                        ),

                                        /// TextField = Preco
                                        CustomTextField(
                                          enable: !controller.isLoading,
                                          validator: (value) {
                                            if (value!.isEmpty || value == '') {
                                              return 'Campo Obrigatório';
                                            } else {
                                              null;
                                            }
                                            return null;
                                          },
                                          controller: controller.amount,
                                          text: 'valor',
                                          inputFormatters: [
                                            MaskInputFormatter(mask: '###'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  crossFadeState: controller.isRegister
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 300)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20, right: 20),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.black),
                                      fixedSize: WidgetStatePropertyAll(Size(
                                          double.maxFinite, double.infinity)),
                                    ),
                                    onPressed: !controller.isLoading
                                        ? () async {
                                            if (controller.isRegister == true &&
                                                firstFormKey.currentState!
                                                    .validate()) {
                                              setState(() {
                                                controller.size =
                                                    !controller.size;
                                                text = 'Cadastrar';
                                              });
                                              controller.toggleRegister();
                                            } else if (controller.isRegister ==
                                                    false &&
                                                secondFormKey.currentState!
                                                    .validate()) {
                                              if (controller
                                                  .flavor.text.isNotEmpty) {
                                                controller.listFlavor.add(
                                                    controller.flavor.text);
                                              }
                                              await controller
                                                  .saveOrderOrCostumer(
                                                      name:
                                                          controller.name.text,
                                                      phoneNumber: controller
                                                          .phoneNumber.text,
                                                      adress: controller
                                                          .adress.text,
                                                      date:
                                                          controller.date.text,
                                                      listFlavors:
                                                          controller.listFlavor,
                                                      app: controller.ifood,
                                                      amount: double.parse(
                                                          controller
                                                              .amount.text));

                                              setState(() {
                                                _animationController.forward();
                                                _animationController
                                                    .addListener(() async {
                                                  if (_opacityRegisterAnimation
                                                      .isCompleted) {
                                                    await Navigator.of(context)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const CostumersSucessRegister()));
                                                    controller.size =
                                                        !controller.size;
                                                    controller.toggleRegister();
                                                  }
                                                });
                                              });
                                            }
                                          }
                                        : null,
                                    child: !controller.isLoading
                                        ? Text(
                                            text,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        : const SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
