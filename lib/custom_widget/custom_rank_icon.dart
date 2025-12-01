import 'package:cpa_core/constants/core_icons.dart';
import 'package:cpa_core/cpa_core.dart';
import 'package:flutter/material.dart';

class CustomRankIcon extends StatelessWidget {
  const CustomRankIcon({
    super.key,
    this.rankNumber,
    this.rankNumberColor,
    this.size,
    this.iconColor,
  });
  final String? rankNumber;
  final Color? rankNumberColor, iconColor;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          CoreIcons.rankingShape,
          width: size ?? 25,
          colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.gold[1],
            BlendMode.srcIn,
          ),
        ),
        Text(
          rankNumber ?? '1',
          style: context.textTheme.bodyMedium?.copyWith(
            color: rankNumberColor ?? AppColors.bgColor,
          ),
        ),
      ],
    );
  }
}
