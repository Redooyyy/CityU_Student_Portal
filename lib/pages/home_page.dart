import 'package:cityu_student_protal/custom_components/cancel_button.dart';
import 'package:cityu_student_protal/custom_components/date_weak_chip.dart';
import 'package:cityu_student_protal/custom_components/routine_card.dart';
import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:cityu_student_protal/custom_widget/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  bool selected = false;
  final List<String> date = ["23", "24", "25", "26", "27", "28", "29", "30"];
  final List<String> week = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  final String month = "October";
  String? s;
  int selectedIndex = -1;

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/homeBackground.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Cancel(
          //   onTab: () {
          //     print("Cancel");
          //   },
          //   animation: false,
          // ).cancelButton(),

          //customCard
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //NOTE:For debugging purpose
              if (widget.s != null)
                Text(
                  widget.s!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  height: 126,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.week.length,
                    itemBuilder: (context, index) {
                      return DateWeakChip(
                        selected: widget.selectedIndex == index,
                        sigmaX: 0,
                        sigmaY: 0,
                        day: widget.week[index],
                        date: widget.date[index],
                        month: widget.month,
                        onTab: () {
                          setState(() {
                            widget.selectedIndex = index;
                            print(widget.date[index]);
                            widget.s =
                                widget.date[index] +
                                " " +
                                widget.week[index] +
                                " " +
                                widget.month;
                          });
                        },
                      ).myCard();
                    },
                  ),
                ),
              ),
              RoutineCard(
                startTime: "11:50",
                endTime: "01:10",
                courseTitle: "Object Oriented Programming",
                courseCode: "CSE-2111",
                section: "65_B",
                teacherName: "AHM",
                roomNumber: "226",
                onTab: () {
                  print("Hehe");
                },
              ).card(),

              RoutineCard(
                startTime: "11:50",
                endTime: "01:10",
                courseTitle: "Object Oriented Programming",
                courseCode: "CSE-2111",
                section: "65_B",
                teacherName: "AHM",
                roomNumber: "226",
                onTab: () {
                  print("Hehe");
                },
              ).card(),
            ],
          ),
        ],
      ),
    );
  }
}
