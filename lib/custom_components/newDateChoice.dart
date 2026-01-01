import 'package:flutter/material.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';

class NDateWeakChip {
  final String day;
  final String date;
  final String? month;
  final GestureTapCallback onTab;
  final bool selected;

  NDateWeakChip({
    required this.day,
    required this.date,
    this.month,
    required this.onTab,
    this.selected = false,
  });

  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 16, 4, 16),
      child: GestureDetector(
        onTap: onTab,
        child: OCLiquidGlassGroup(
          settings: OCLiquidGlassSettings(
            blurRadiusPx: 10,
            refractStrength: 0.25,
            specStrength: .6,
          ),
          child: OCLiquidGlass(
            shadow: selected
                ? BoxShadow(
                    color: Colors.blue,
                    blurRadius: 5,
                    blurStyle: BlurStyle.inner,
                  )
                : null,
            width: 72,
            borderRadius: 23,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                Text(
                  month ?? "",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
