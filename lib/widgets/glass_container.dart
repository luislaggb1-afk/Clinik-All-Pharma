
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final Color color;
  final double elevation;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.borderRadius = 20,
    this.color = Colors.white,
    this.elevation = 10,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: color.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
