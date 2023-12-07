import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.lable,
    required this.hintText,
    required this.controller,
    // required this.validator,
  });
  final String lable, hintText;
  final TextEditingController controller;
  // final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        label: Text(lable, style: const TextStyle(color: Color(0xff6A6A6A))),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6A6A6A))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff404040))),
      ),
      style: const TextStyle(color: Color(0xff404040), fontSize: 19),
      cursorColor: const Color(0xff404040),
    );
  }
}
