import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:flutter/material.dart';

class RoutineCard {
  Widget card() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
            child: GlassContainer2(
              center: false,
              width: double.infinity,
              height: 200,
              borderRadiuss: .horizontal(left: Radius.circular(25)),
              //NOTE:For time
              child: scedule("9:30", "11:50"),
            ),
          ),
        ),
        //NOTE:For course
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 15, 0),
            child: GlassContainer2(
              width: double.infinity,
              height: 200,
              borderRadiuss: .horizontal(right: Radius.circular(25)),
              //NOTE:For course
              child: Text("Ohayo"),
            ),
          ),
        ),
      ],
    );
  }
}

Widget scedule(String start, String end) {
  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  start,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      // Expanded(
      //   flex: 4,
      //   child: Column(
      //     children: [
      //       Container(width: 50, height: 133, color: Colors.green),
      //     ],
      //   ),
      // ),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  end,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
