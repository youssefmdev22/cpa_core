import 'package:cpa_core/cpa_core.dart';
import 'package:cpa_core/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomCategoryTextItem extends StatelessWidget {
  const CustomCategoryTextItem({
    super.key,
    this.isActive = false,
    this.borderRadius,
    this.title,
    this.colorItem,
    this.colorTextAndIcon,
    this.colorBorder,
    this.iconItem,
    this.fontTextSize,
    this.onTap,
    this.iconSize,
    this.borderSide,
    this.hasInActiveColor = false,
    this.inActiveColor,
  });

  final bool? isActive, borderSide, hasInActiveColor;
  final double? borderRadius, fontTextSize, iconSize;
  final String? title;
  final Color? colorItem, colorTextAndIcon, colorBorder, inActiveColor;
  final IconData? iconItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool active = isActive ?? false;
    final bool showBorder = borderSide ?? false;
    final bool useInActiveColor = hasInActiveColor ?? false;

    Color resolveBackgroundColor() {
      if (useInActiveColor) {
        return active
            ? (colorItem ?? context.theme.colorScheme.primary)
            : (inActiveColor ?? Colors.transparent);
      }
      return active
          ? (colorItem ?? context.theme.colorScheme.primary)
          : Colors.transparent;
    }

    Border? resolveBorder() {
      if (!showBorder || active) return null;
      return Border.all(
        color: colorBorder ?? context.theme.colorScheme.onSecondary,
        width: 1,
      );
    }

    final Color textColor =
        colorTextAndIcon ?? context.theme.colorScheme.onSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: resolveBackgroundColor(),
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: resolveBorder(),
        gradient: active
            ? LinearGradient(
                colors: [
                  (colorItem ?? context.theme.colorScheme.primary).withValues(
                    alpha: 0.8,
                  ),
                  (colorItem ?? context.theme.colorScheme.primary),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          if (iconItem != null)
            Icon(iconItem, color: textColor, size: iconSize ?? 16),
          Text(
            title ?? CoreLocalizations.of(context).unknown,
            style: context.bodyLarge?.copyWith(
              color: textColor,
              fontSize: fontTextSize ?? 16,
            ),
          ),
        ],
      ),
    ).applyBounceable(onTap: onTap);
  }
}
