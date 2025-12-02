import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future customAuthDialog(
  BuildContext context, {
  required double width,
  required double height,
  required Widget child,
  double? firstPadding,
  double? secondPadding,
  bool backgroundGradient = false,
  final bool? closedBorder = false,
}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: backgroundGradient
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(1, 214, 118, 0.5),
                    Color.fromRGBO(1, 214, 118, 0.0),
                  ],
                  stops: [0.0, 0.4],
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(firstPadding ?? 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          border: closedBorder == true
                              ? Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                )
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Color(0xffa9a9ca),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(secondPadding ?? 24),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
