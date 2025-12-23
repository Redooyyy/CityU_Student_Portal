import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer2 extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  const GlassContainer2({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.borderRadius = 30,
    this.boxShadow,
    this.sigmaX = 4.0,
    this.sigmaY = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,

        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: .circular(borderRadius),
                border: .all(color: Colors.white.withValues(alpha: 0.2)),
                boxShadow: boxShadow ?? boxShadow,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.15),
                    Colors.white.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
