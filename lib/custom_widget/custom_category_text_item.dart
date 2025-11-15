import 'package:cpa_core/cpa_core.dart';
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
  });
  final bool? isActive, borderSide;
  final double? borderRadius, fontTextSize, iconSize;
  final String? title;
  final Color? colorItem, colorTextAndIcon, colorBorder;
  final IconData? iconItem;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isActive == true
              ? colorItem ?? context.theme.colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          border: borderSide == true
              ? isActive == false
                    ? Border.all(
                        color:
                            colorBorder ??
                            context.theme.colorScheme.onSecondary,
                        width: 1,
                      )
                    : null
              : null,
        ),
        child: Row(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconItem ?? FontAwesomeIcons.circle,
              color: colorTextAndIcon ?? context.theme.colorScheme.onSecondary,
              size: iconSize ?? 16,
            ),
            Text(
              title ?? "",
              style: context.bodyLarge?.copyWith(
                color:
                    colorTextAndIcon ?? context.theme.colorScheme.onSecondary,
                fontSize: fontTextSize ?? 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
