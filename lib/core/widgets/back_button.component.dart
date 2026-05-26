import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          blurRadius: 6.0, // How blurred the shadow is
                          offset: const Offset(0, 0), // Offset of the shadow
                        ),
                      ],
        ),
        child: const Icon(Icons.arrow_back)).onTap(Get.back);
}
