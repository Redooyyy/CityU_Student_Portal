import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:flutter/material.dart';

class RoutineCard {
  final String startTime;
  final String endTime;
  final String courseTitle;
  final String courseCode;
  final String section;
  final String teacherName;
  final String roomNumber;
  final VoidCallback onTab;

  RoutineCard({
    required this.startTime,
    required this.endTime,
    required this.courseTitle,
    required this.courseCode,
    required this.section,
    required this.teacherName,
    required this.roomNumber,
    required this.onTab,
  });

  Widget card() {
    double cardHeight = 191;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 5, 8),
            child: GlassContainer2(
              center: false,
              width: double.infinity,
              height: cardHeight,
              borderRadiuss: .horizontal(left: Radius.circular(25)),
              //NOTE:For time
              child: scedule(startTime, endTime),
            ),
          ),
        ),
        //NOTE:For course
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 15, 8),
            child: GlassContainer2(
              sigmaX: 0,
              sigmaY: 0,
              center: false,
              width: double.infinity,
              height: cardHeight,
              borderRadiuss: .horizontal(right: Radius.circular(25)),
              //NOTE:For course
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    course(courseTitle),
                    const SizedBox(height: 18),
                    details("Course", courseCode),
                    details("Section", section),
                    teacher(teacherName, onTab),
                    details("Room", roomNumber),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget scedule(String start, String end) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            end,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget course(String courseName) {
  return Text(
    courseName,
    style: TextStyle(
      color: Color.fromRGBO(167, 207, 240, .85),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget details(String title, String info) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //NOTE:COURSE CODE
      Text(
        title,
        style: TextStyle(
          color: Colors.white.withValues(alpha: .8),
          fontSize: 13,
        ),
      ),
      Text(
        info,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget teacher(String teacherName, VoidCallback onTab) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //NOTE:COURSE CODE
      Text(
        "Teacher",
        style: TextStyle(
          color: Colors.white.withValues(alpha: .8),
          fontSize: 13,
        ),
      ),
      GestureDetector(
        //TODO:Open teacher card
        onTap: onTab,
        child: Text(
          teacherName,
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
