import 'package:cpa_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomWidgetWrapperItems extends StatelessWidget {
  const CustomWidgetWrapperItems({
    super.key,
    this.child,
    this.paddingItems,
    this.borderColor,
    this.borderRadius,
    this.bgColor,
    this.borderSideWidth,
    this.width,
    this.height,
  });
  final Widget? child;
  final double? paddingItems, borderRadius, borderSideWidth, width, height;
  final Color? borderColor, bgColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.bgColor[20],
          border: Border.all(
            width: borderSideWidth ?? 0.25,
            color: borderColor ?? AppColors.blue[0]!,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),

        padding: EdgeInsets.all(paddingItems ?? 16),
        child: child,
      ),
    );
  }
}
