import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizzaria/src/features/costumers/screens/costumers_page.dart';

class CostumersSucessRegister extends StatefulWidget {
  const CostumersSucessRegister({super.key});

  @override
  State<CostumersSucessRegister> createState() =>
      _CostumersSucessRegisterState();
}

class _CostumersSucessRegisterState extends State<CostumersSucessRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 150,
              ),
              LottieBuilder.asset(
                'assets/lottie/sucess.json',
                height: 250,
                width: 250,
              ),
              const Text('Registrado com sucesso!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * .35),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    fixedSize: WidgetStatePropertyAll(
                        Size(double.maxFinite, double.infinity)),
                  ),
                  child: const Text(
                    'Concluir',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .1),
            ],
          ),
        ),
      ),
    );
  }
}
