import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CInputField extends StatelessWidget {
  const CInputField(
      {super.key,
      this.text,
      this.hintext,
      required this.controller,
      this.validator, this.suffix, this.obscure = false, this.prefixIcon});

  final String? text;
  final String? hintext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool obscure;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon!.paddingSymmetric(horizontal: 12),
        hintText: text,
      ),
    );
  }
}
