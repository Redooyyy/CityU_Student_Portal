import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:flutter/material.dart';

class DateWeakChip {
  final double sigmaX;
  final double sigmaY;
  final String day;
  final String date;
  final String month;
  final GestureTapCallback onTab;
  final bool selected;

  DateWeakChip({
    required this.sigmaX,
    required this.sigmaY,
    required this.day,
    required this.date,
    required this.month,
    required this.onTab,
    this.selected = false,
  });

  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTab,
        child: GlassContainer2(
          sigmaY: sigmaY,
          sigmaX: sigmaX,
          width: 90,
          height: 110,
          borderRadius: 20,
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 80,
                    spreadRadius: -25,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10,
                    offset: Offset(80, 0),
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10,
                    offset: Offset(-80, 0),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    offset: Offset(95, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    offset: Offset(15, 115),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    offset: Offset(90, 90),
                  ),
                ],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  day,
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  month,
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
