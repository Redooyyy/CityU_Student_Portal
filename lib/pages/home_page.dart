import 'package:cityu_student_protal/custom_components/date_weak_chip.dart';
import 'package:cityu_student_protal/custom_components/routine_card.dart';
import 'package:cityu_student_protal/database/testing_data.dart';
import 'package:cityu_student_protal/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  bool selected = false;
  Map<String, String>? dateTimeInfo;
  String? month;
  final List<String> week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> date = ["27", "28", "29", "30", "31", "01", "02"];
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? s;
  String? currentDay;
  int selectedIndex = 0;
  Map<String, dynamic>? routine;

  Future<void> loadData() async {
    final data = await TestingData.loadRoutine();
    setState(() {
      routine = data;
      print(routine);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.dateTimeInfo = HelperFunctions().getDateInfo();
    currentDay = widget.dateTimeInfo!['day'];
    // selectedIndex = widget.week.indexOf(currentDay!);
    // if (selectedIndex == -1) {
    //   selectedIndex = 0; // fallback
    // }

    loadData();
  }

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
          //customCard
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 65),
              Center(
                child: SizedBox(
                  height: 126,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final dates7 = HelperFunctions().getDateInfo(
                        offsetDays: index,
                      );
                      String week7 = dates7["day"]!;
                      String date7 = dates7["date"]!;
                      String month7 = dates7["month"]!;
                      return DateWeakChip(
                        selected: selectedIndex == index,
                        sigmaX: 0,
                        sigmaY: 0,
                        day: week7,
                        date: date7,
                        month: month7,
                        onTab: () {
                          setState(() {
                            selectedIndex = index;
                            print(widget.date[index]);
                            currentDay = widget.week[index];
                          });
                        },
                      ).myCard();
                    },
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: routine![currentDay].length,

                  //BUG:Wednesday, Thursday and Friday class off values must be handle
                  itemBuilder: (context, index) {
                    final course = routine![currentDay][index];
                    final bool lol = routine!.containsKey("Class");
                    return lol
                        ? Text("Holiday")
                        : RoutineCard(
                            startTime: course["start_time"],
                            endTime: course["end_time"],
                            courseTitle: course["courseTitle"],
                            courseCode: course["courseCode"],
                            section: course["section"],
                            teacherName: course["teacher"],
                            roomNumber: course["room"],
                            onTab: () {
                              print("tabbed");
                              print(course["teacher"]);
                            },
                          ).card();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
