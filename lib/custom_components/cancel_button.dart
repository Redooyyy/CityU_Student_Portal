import 'package:cityu_student_protal/custom_widget/glassy_button_loading.dart';
import 'package:flutter/material.dart';

class Cancel {
  final Function onTab;
  final double height;
  final double width;

  const Cancel({required this.onTab, this.height = 45, this.width = 100});

  Widget cancelButton() {
    return Center(
      child: GlassButton(
        blurX: 3,
        blurY: 3,
        isBorderButton: true,
        loadingColor: Colors.red,
        TextWidget: cancel(),
        onTab: () async {
          await Future.delayed(Duration(seconds: 5));
          onTab();
        },
        width: width,
        height: height,
      ),
    );
  }

  Widget cancel() {
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
