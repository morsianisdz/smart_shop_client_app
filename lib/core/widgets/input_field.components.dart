import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CInputField extends StatelessWidget {
  const CInputField({
    super.key,
    this.text,
    required this.controller,
    this.validator,
    this.suffix,
    this.obscure = false,
    this.prefixIcon,
    this.onChanged
  });

  final String? text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool obscure;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon!.paddingSymmetric(horizontal: 12),
        hintText: text,
      ),
    );
  }
}
