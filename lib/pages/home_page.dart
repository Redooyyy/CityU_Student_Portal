import 'package:cityu_student_protal/custom_widget/glass_container2.dart';
import 'package:flutter/material.dart';

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
                image: NetworkImage(
                  'https://wallpaperaccess.com/full/1638902.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: GlassContainer2(
              width: 90,
              height: 45,
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red.withValues(alpha: .9),
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      offset: Offset(0, 25),
                      blurRadius: 45,
                    ),
                    Shadow(
                      color: Colors.red,
                      offset: Offset(0, -25),
                      blurRadius: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
