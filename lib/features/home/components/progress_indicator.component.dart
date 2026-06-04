import 'package:flutter/material.dart';

class CProgressIndicator extends StatelessWidget {
  const CProgressIndicator({
    super.key,
    required this.value,
    required this.color,
  });
  final double value;
  final Color color;
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: LinearProgressIndicator(
      value: value,
      backgroundColor: Colors.white10,
      valueColor: AlwaysStoppedAnimation<Color>(color),
      minHeight: 8,
    ),
  );
}
