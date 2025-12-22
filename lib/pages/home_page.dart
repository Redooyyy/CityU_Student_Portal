import 'package:cityu_student_protal/custom_components/cancel_button.dart';
import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:cityu_student_protal/custom_widget/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  myCard("Sat", "23", "October"),
                  myCard("Sun", "24", "October"),
                  myCard("Mon", "25", "October"),
                  myCard("Tue", "26", "October"),
                  myCard("Wed", "27", "October"),
                  myCard("Thu", "28", "October"),
                  myCard("Fri", "29", "October"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myCard(String day, String date, String month) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassContainer2(
        width: 90,
        height: 110,
        borderRadius: 20,
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(95, 0)),
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
    );
  }
}
