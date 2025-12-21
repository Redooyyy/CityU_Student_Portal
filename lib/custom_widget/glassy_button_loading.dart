import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GlassButton extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final IconData? icon;
  final Function onTab;
  final bool isBorderButton;
  const GlassButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTab,
    required this.title,
    this.icon,
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
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                    color: widget.isBorderButton ? Colors.white : Colors.white,
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
                      if (showText)
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: widget.isBorderButton
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
