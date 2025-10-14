import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../generated/l10n.dart';

class CustomOrDividerWidget extends StatelessWidget {
  const CustomOrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = CoreLocalizations.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  AppColors.blue[0]!,
                  AppColors.blue[0]!.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        Text(
          local.or,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.blue[0],
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.poppinsFont,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.blue[0]!,
                  AppColors.blue[0]!.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
