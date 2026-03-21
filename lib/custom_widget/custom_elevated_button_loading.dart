import 'package:cpa_core/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonLoading extends StatelessWidget {
  const CustomElevatedButtonLoading({
    super.key,
    this.heightButton,
    this.widthButton,
    this.borderButton,
    this.textButton,
    this.textStyleButton,
    this.colorButton,
    this.onPressed,
    this.loadingColor,
    this.isLoading = false,
    this.isExpanded = true,
  });

  final bool? isLoading;
  final double? heightButton, widthButton, borderButton;
  final String? textButton;
  final TextStyle? textStyleButton;
  final Color? colorButton, loadingColor;
  final void Function()? onPressed;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = CoreLocalizations.of(context);

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton ?? theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderButton ?? 8),
          ),
        ),
        onPressed: (isLoading ?? false) ? null : onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: (isLoading ?? false) ? 0.0 : 1.0,
              child: Text(textButton ?? local.done, style: textStyleButton),
            ),
            if (isLoading ?? false)
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
