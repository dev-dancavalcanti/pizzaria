import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? function;
  final String text;
  final IconData icon;
  const MyButton(
      {super.key,
      required this.function,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 125,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: IconButton(
                  onPressed: function,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                text,
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
