import 'package:cpa_core/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void customToastification(
  BuildContext context,
  ToastificationType type,
  String? message,
) {
  final defaultMessage =
      message ??
      (type == ToastificationType.success
          ? CoreLocalizations.of(context).success
          : CoreLocalizations.of(context).error);

  toastification.show(
    context: context,
    title: Text(defaultMessage),
    type: type,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.bottomRight,
  );
}
