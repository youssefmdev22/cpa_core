import 'package:cpa_core/cpa_core.dart';
import 'package:cpa_core/utils/build_avatar_url.dart';
import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    this.imageUrl,
    this.size,
    this.borderWidth,
    this.borderColor,
    this.onTap,
  });
  final String? imageUrl;
  final double? size, borderWidth;
  final Color? borderColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 50,
      height: size ?? 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? AppColors.white,
          width: borderWidth ?? 2,
        ),
      ),
      child: ClipOval(
        child: CustomCachedNetworkImage(
          fit: BoxFit.cover,
          width: size ?? 50,
          height: size ?? 50,
          imageUrl: buildImageUrl(fileName: imageUrl),
        ),
      ).applyBounceable(onTap: onTap),
    );
  }
}
