import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final IconButton? icon;
  final bool? enable;
  final String? Function(String?)? validator;
  final void Function(String)? function;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.enable,
      this.inputFormatters,
      this.icon,
      this.validator,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: TextFormField(
        enabled: enable,
        validator: validator,
        onChanged: function,
        controller: controller,
        inputFormatters: inputFormatters,
        autofocus: false,
        decoration: InputDecoration(
            labelText: '  $text  ',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.only(left: 15),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixIcon: icon),
      ),
    );
  }
}
