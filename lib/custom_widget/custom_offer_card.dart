import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cpa_core/constants/app_colors.dart';
import 'package:cpa_core/custom_widget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../generated/l10n.dart';

class CustomOfferCard extends StatelessWidget {
  final String? title;
  final String? badgeTitle;
  final String? imageUrl;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final Color? badgeColor;
  final double? rating;
  final int? requiredPoints;
  final VoidCallback? onTap;

  const CustomOfferCard({
    super.key,
    this.title,
    this.badgeTitle,
    this.imageUrl,
    this.backgroundColor,
    this.gradient,
    this.badgeColor,
    this.rating,
    this.requiredPoints,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      width: 140,
      height: 240,
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                backgroundColor ?? AppColors.mainColor,
                backgroundColor != null
                    ? backgroundColor!.withValues(alpha: 0.6)
                    : AppColors.mainColor.withValues(alpha: 0.6),
              ],
            ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ?Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                color: badgeColor ?? AppColors.mainColor,
              ),
              child: Text(
                badgeTitle ?? "",
                style: context.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ).showIf(badgeTitle != null),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: requiredPoints != null ? 2 : 0,
                      sigmaY: requiredPoints != null ? 2 : 0,
                    ),
                    child: CustomCachedNetworkImage(
                      imageUrl: imageUrl ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                  ?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      const Icon(
                        FontAwesomeIcons.lock,
                        color: AppColors.white,
                        size: 30,
                      ),
                      Text(
                        CoreLocalizations.of(
                          context,
                        ).pointsRequiredToUnlock.format([requiredPoints ?? 0]),
                        textAlign: TextAlign.center,
                        style: context.bodySmall,
                      ),
                    ],
                  ).showIf(requiredPoints != null),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title ?? CoreLocalizations().appName,
              style: context.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 4),
          ?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RatingBar.builder(
              initialRating: rating!,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 10,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => const Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 10,
              ),
              unratedColor: Colors.amber.withValues(alpha: .5),
              onRatingUpdate: (_) {},
            ),
          ).showIf(rating != null),
          const SizedBox(height: 10),
        ],
      ),
    ).applyBounceable(onTap: requiredPoints != null ? () {} : onTap);
  }
}
