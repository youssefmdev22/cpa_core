import 'package:cpa_core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStatisticsRocketWidgets extends StatelessWidget {
  const CustomStatisticsRocketWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.mainColor.withValues(alpha: 0.15),
      ),
      child: const Icon(
        FontAwesomeIcons.rocket,
        color: AppColors.mainColor,
        size: 20,
      ),
    );
  }
}
