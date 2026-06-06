import 'package:flutter/material.dart';

class AnimatedScannerLine extends StatelessWidget {
  final Animation<double> animation;
  final double width;

  const AnimatedScannerLine({
    super.key, 
    required this.animation, 
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // This positions the line vertically based on animation value
        return Positioned(
          top: animation.value, 
          left: 10,
          right: 10,
          child: IgnorePointer(
            child: Container(
              height: 120, // Height of the glowing beam area
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange.withOpacity(0.0), // Fades out at top
                    Colors.orange.withOpacity(0.4), // Strongest in center
                    Colors.orange.withOpacity(0.0), // Fades out at bottom
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Column(
                children: [
                  // The actual thin glowing horizontal line
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(color: Colors.orange, blurRadius: 8, spreadRadius: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}