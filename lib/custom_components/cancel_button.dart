import 'package:cityu_student_protal/custom_widget/glassy_button_loading.dart';
import 'package:flutter/material.dart';

class Cancel {
  final Function onTab;
  final double height;
  final double width;
  final bool animation;

  const Cancel({
    required this.onTab,
    this.height = 45,
    this.width = 100,
    this.animation = true,
  });

  Widget cancelButton() {
    return Center(
      child: GlassButton(
        loadingCircleSize: 20,
        buttonColor: Colors.transparent,
        blurX: 3,
        blurY: 3,
        isBorderButton: true,
        loadingColor: Colors.red,
        TextWidget: cancel(),
        onTab: () async {
          animation ? await Future.delayed(Duration(seconds: 5)) : null;
          onTab();
        },
        width: width,
        height: height,
      ),
    );
  }

  Text cancel() {
    return Text(
      "Cancel",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.red.withValues(alpha: .9),
        shadows: [
          Shadow(color: Colors.red, offset: Offset(0, 24), blurRadius: 40),
          Shadow(color: Colors.red, offset: Offset(0, -24), blurRadius: 40),
        ],
      ),
    );
  }
}
