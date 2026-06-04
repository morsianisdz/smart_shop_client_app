import 'package:flutter/material.dart';

class CInputField extends StatelessWidget {
  const CInputField({super.key, this.icon, this.obscureText});

  final Widget? icon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: icon,
      ),
    );
  }
}
