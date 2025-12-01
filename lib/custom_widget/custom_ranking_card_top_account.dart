import 'package:flutter/material.dart';

class CustomRankingCardTopAccount extends StatelessWidget {
  const CustomRankingCardTopAccount({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.bgColor,
    this.gradientColors,
    this.hasGradient = true,
  });
  final Widget child;
  final double? width, height, borderRadius;
  final Color? bgColor;
  final List<Color>? gradientColors;
  final bool? hasGradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: height ?? 180,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 16),
          topRight: Radius.circular(borderRadius ?? 16),
        ),
        gradient: hasGradient == true
            ? LinearGradient(
                colors:
                    gradientColors ??
                    [const Color(0xFF0B0F14), const Color(0x997C5CFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
      child: child,
    );
  }
}
