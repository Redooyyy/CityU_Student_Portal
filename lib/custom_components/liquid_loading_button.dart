import 'package:flutter/material.dart';
import 'package:liquid_glass_container_plus/liquid_glass_container_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LiquidLoadingButton extends StatefulWidget {
  final double width;
  final double height;
  final Future<void> Function() onTap;
  final Widget textWidget;
  final IconData? icon;
  final double loadingCircleSize;
  final double shrinkSize;
  final double buttonBorderRadius;

  const LiquidLoadingButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.textWidget,
    this.icon,
    this.loadingCircleSize = 35,
    this.shrinkSize = 60,
    this.buttonBorderRadius = 20,
  });

  @override
  State<LiquidLoadingButton> createState() => _LiquidLoadingButtonState();
}

class _LiquidLoadingButtonState extends State<LiquidLoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnim;
  late Animation<double> _glassAnim;

  bool isLoading = false;
  bool showText = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _widthAnim = Tween<double>(
      begin: widget.width,
      end: widget.shrinkSize,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _glassAnim = Tween<double>(
      begin: 0.15,
      end: 0.35,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  Future<void> _handleTap() async {
    setState(() {
      isLoading = true;
      showText = false;
    });

    await _controller.forward();
    await widget.onTap();
    await _controller.reverse();

    setState(() {
      isLoading = false;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => showText = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
          child: LiquidGlassContainer(
            settings: LiquidGlassSettings(
              blurRadiusPx: 10,
              refractStrength: .21,
            ),
            borderRadius: widget.buttonBorderRadius,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isLoading ? null : _handleTap,
                child: SizedBox(
                  width: _widthAnim.value,
                  height: widget.height,
                  child: Center(
                    child: isLoading
                        ? LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.white,
                            size: widget.loadingCircleSize,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.icon != null)
                                Icon(widget.icon, color: Colors.white),
                              if (widget.icon != null && showText)
                                const SizedBox(width: 8),
                              if (showText) widget.textWidget,
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
