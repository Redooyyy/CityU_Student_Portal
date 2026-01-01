import 'package:flutter/material.dart';
import 'package:liquid_glass_container_plus/liquid_glass_container_plus.dart';

LiquidGlassContainer myLiquidContainer(
  BuildContext context,
  Widget child, {
  Color? bgColor = Colors.white,
  double lightStrength = 0.9,
  double blurRadiusPx = 0.9,
  double? width,
  double? borderRadius = 20,
}) {
  return LiquidGlassContainer(
    width: width,
    borderRadius: borderRadius ?? 20,
    settings: LiquidGlassSettings(
      blendPx: 20,
      refractStrength: -0.06,
      specAngle: 0.8,
      blurRadiusPx: blurRadiusPx,
      specWidth: 2,
      lightbandColor: bgColor ?? Colors.white,
      lightbandStrength: lightStrength,
    ),
    child: Padding(padding: const EdgeInsets.all(12.0), child: child),
  );
}
