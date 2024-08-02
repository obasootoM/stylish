import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.inputType,
      this.obscure = false,
      this.suffixIcon,
      this.prefixIcon,
      required this.hintext,
      this.color,
      this.validator,
      required this.focusNode});
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintext;
  final Color? color;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        obscureText: obscure,
        style: const TextStyle(
            fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.normal),
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintext,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
