import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GlassButton extends StatefulWidget {
  final double height;
  final double width;
  final double blurX;
  final double blurY;
  final Widget TextWidget;
  final IconData? icon;
  final Function onTab;
  final bool isBorderButton;
  final Color loadingColor;
  const GlassButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTab,
    required this.TextWidget,
    this.blurX = 10.0,
    this.blurY = 10.0,
    this.icon,
    this.loadingColor = Colors.white,
    this.isBorderButton = false,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isLoading = false;
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: widget.blurX, sigmaY: widget.blurY),
        child: InkWell(
          onTap: () async {
            setState(() {
              isLoading = true;
              showText = false;
            });
            await widget.onTab();
            setState(() => isLoading = false);
            Future.delayed(Duration(milliseconds: 100)).then((_) {
              setState(() => showText = true);
            });
          },
          child: AnimatedContainer(
            width: isLoading ? 60 : widget.width,
            height: widget.height,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: widget.isBorderButton
              //         ? Colors.white.withValues(alpha: 0.2)
              //         : Colors.pink.withAlpha(50),
              //     blurRadius: 10,
              //     offset: Offset(0, 10),
              //   ),
              // ],
              border: widget.isBorderButton
                  ? Border.all(color: Colors.white.withValues(alpha: 0.3))
                  : null,
              color: widget.isBorderButton
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.pink,
            ),
            child: isLoading
                ? LoadingAnimationWidget.threeArchedCircle(
                    color: widget.loadingColor,
                    size: 35,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        Icon(
                          widget.icon,
                          color: widget.isBorderButton
                              ? Colors.pink
                              : Colors.white,
                        ),
                      if (widget.icon != null) SizedBox(width: 8),
                      if (showText) widget.TextWidget,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
