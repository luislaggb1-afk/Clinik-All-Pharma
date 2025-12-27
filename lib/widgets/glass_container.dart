
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final Color color;
  final double elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.borderRadius = 20,
    this.color = Colors.white,
    this.elevation = 10,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding,
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
