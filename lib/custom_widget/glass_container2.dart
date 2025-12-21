import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer2 extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const GlassContainer2({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(30),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,

        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: .circular(30),
                border: .all(color: Colors.white.withValues(alpha: 0.13)),
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
