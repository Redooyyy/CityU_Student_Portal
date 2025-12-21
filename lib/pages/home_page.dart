import 'package:cityu_student_protal/custom_components/cancel_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://wallpaperaccess.com/full/1638902.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Cancel(
            onTab: () {
              print("Cancel");
            },
            animation: false,
          ).cancelButton(),
        ],
      ),
    );
  }
}
