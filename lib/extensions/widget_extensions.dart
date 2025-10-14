import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension SkeletonizerExtension on Widget {
  Widget applySkeletonizer({
    bool enabled = true,
    PaintingEffect? effect,
    TextBoneBorderRadius? textBoneBorderRadius,
    bool? ignoreContainers,
    bool? justifyMultiLineText,
    Color? containersColor,
    bool ignorePointers = true,
    bool? enableSwitchAnimation,
    SwitchAnimationConfig? switchAnimationConfig,
  }) {
    return Skeletonizer(
      enabled: enabled,
      effect: effect,
      textBoneBorderRadius: textBoneBorderRadius,
      ignoreContainers: ignoreContainers,
      justifyMultiLineText: justifyMultiLineText,
      containersColor: containersColor,
      ignorePointers: ignorePointers,
      enableSwitchAnimation: enableSwitchAnimation,
      switchAnimationConfig: switchAnimationConfig,
      child: this,
    );
  }
}
