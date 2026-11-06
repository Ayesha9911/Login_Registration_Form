import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller, KeyboardType, labelText, hintText, prefixIcon, validator;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.KeyboardType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: KeyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      validator: validator,
    );
  }
}