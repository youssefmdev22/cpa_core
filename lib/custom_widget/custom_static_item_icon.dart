import 'package:cpa_core/cpa_core.dart';
import 'package:flutter/material.dart';

class CustomStaticItemIcon extends StatelessWidget {
  const CustomStaticItemIcon({
    super.key,
    this.borderRadius,
    this.colorItem,
    this.colorIcon,
    this.iconItem,
    this.onTap,
    this.iconSize,
  });
  final double? borderRadius, iconSize;
  final Color? colorItem, colorIcon;
  final IconData? iconItem;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          color:
              colorItem?.withValues(alpha: 0.2) ??
              context.primaryColor.withValues(alpha: 0.2),
        ),
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: colorItem ?? context.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              iconItem ?? FontAwesomeIcons.circle,
              color: colorIcon ?? context.theme.colorScheme.onSecondary,
              size: iconSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
