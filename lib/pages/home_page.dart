import 'package:cityu_student_protal/custom_components/cancel_button.dart';
import 'package:cityu_student_protal/custom_components/date_weak_chip.dart';
import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:cityu_student_protal/custom_widget/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  bool selected = false;
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
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //NOTE:Testing values
                  //TODO:Fetch from API
                  DateWeakChip(
                    day: "Sat",
                    month: "October",
                    date: "22",
                    sigmaY: 0,
                    sigmaX: 0,
                    selected: widget.selected,
                    onTab: () {
                      print("Tabbed");
                      widget.selected = !widget.selected;
                      setState(() {});
                    },
                  ).myCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
