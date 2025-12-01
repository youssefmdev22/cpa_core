import 'package:cpa_core/cpa_core.dart';
import 'package:cpa_core/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomRankingTopAchiever extends StatelessWidget {
  const CustomRankingTopAchiever({
    super.key,
    this.rankColor,
    this.widthProfileImage,
    this.rankNumber,
    this.onTap,
    this.rankNumberColor,
    this.name,
    this.imageUrl,
    this.nameColor,
  });
  final String? rankNumber, name, imageUrl;
  final double? widthProfileImage;
  final Color? rankColor, rankNumberColor , nameColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final local = CoreLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1E1E2E),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x40FFCD1C),
                blurRadius: 46.522,
                offset: Offset(0, 1.304),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              CustomProfileImage(
                size: widthProfileImage ?? 60,
                borderColor: rankColor ?? AppColors.orange,
                borderWidth: 3,
                imageUrl: imageUrl,
              ),
              Positioned(
                top: 50,
                child: CustomRankIcon(
                  rankNumber: rankNumber,
                  rankNumberColor: rankNumberColor,
                  iconColor: rankColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Text(
              name ?? local.unKnow,
              style: context.textTheme.bodyMedium?.copyWith(
                color: nameColor?? AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.open_in_new_rounded,
              size: 18,
              color: AppColors.gray[90],
              fontWeight: FontWeight.w400,
            ).applyBounceable(onTap: onTap),
          ],
        ),
        const SizedBox(height: AppMeasurements.paddingSmall),
        Text(
          local.prize,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.gray[70],
          ),
        ),
      ],
    );
  }
}
