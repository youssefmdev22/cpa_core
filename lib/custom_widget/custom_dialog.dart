import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../constants/app_colors.dart';

class CustomDialog {
  final BuildContext context;

  String? title, message, positiveText, negativeText;

  VoidCallback? positiveOnClick, negativeOnClick;

  CustomDialog.loading({
    required this.context,
    this.message,
    bool cancelable = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          content: Row(
            spacing: 16,
            children: [
              const CircularProgressIndicator(),
              Text(
                message ?? CoreLocalizations.of(ctx).loading,
                style: Theme.of(ctx).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }

  CustomDialog.positiveButton({
    required this.context,
    this.title,
    this.message,
    this.positiveText,
    this.positiveOnClick,
    bool cancelable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              Text(message ?? ""),
              ElevatedButton(
                onPressed: () {
                  if (positiveOnClick != null) {
                    positiveOnClick!();
                  } else {
                    Navigator.of(ctx).pop();
                  }
                },
                child: Text(
                  positiveText ?? CoreLocalizations.of(ctx).ok,
                  style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  CustomDialog.positiveAndNegativeButton({
    required this.context,
    this.title,
    this.message,
    this.positiveText,
    this.negativeText,
    this.positiveOnClick,
    this.negativeOnClick,
    bool cancelable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              Text(message ?? ""),
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 16,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        side: BorderSide(
                          color: AppColors.black,
                        )
                      ),
                      onPressed: () {
                        if (negativeOnClick != null) {
                          negativeOnClick!();
                        } else {
                          Navigator.of(ctx).pop();
                        }
                      },
                      child: Text(
                        negativeText ?? CoreLocalizations.of(ctx).no,
                        style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (positiveOnClick != null) {
                          positiveOnClick!();
                        } else {
                          Navigator.of(ctx).pop();
                        }
                      },
                      child: Text(
                        positiveText ?? CoreLocalizations.of(ctx).yes,
                        style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
