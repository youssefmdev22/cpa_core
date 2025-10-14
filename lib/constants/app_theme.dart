import 'package:cpa_core/responsive/responsive_text.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fonts_name.dart';

abstract class AppTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgColorColor,
      fontFamily: FontsName.poppinsFont,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.mainColor,
        onPrimary: AppColors.white,
        secondary: AppColors.black,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.mainColor,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
          fontWeight: FontWeight.w700,
        ).responsiveFont(context, fontSize: 24),
        bodySmall: getTextStyle(
          fontWeight: FontWeight.w400,
        ).responsiveFont(context, fontSize: 12),
        bodyMedium: getTextStyle(
          fontWeight: FontWeight.w400,
        ).responsiveFont(context, fontSize: 16),
        bodyLarge: getTextStyle(
          fontWeight: FontWeight.w600,
        ).responsiveFont(context, fontSize: 20),
        headlineMedium: getTextStyle(
          fontWeight: FontWeight.w500,
        ).responsiveFont(context, fontSize: 18),
        headlineSmall: getTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ).responsiveFont(context, fontSize: 14),
        labelSmall: getTextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: FontsName.poppinsFont,
        ).responsiveFont(context, fontSize: 12),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: getTextStyle(fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: AppColors.black),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 16),
        hintStyle: getTextStyle(
          color: const Color(0xff808390),
          fontFamily: FontsName.poppinsFont,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ).responsiveFont(context, fontSize: 13),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return getTextStyle(color: AppColors.red);
          }
          return getTextStyle(color: AppColors.gray);
        }),
        errorStyle: getTextStyle(color: AppColors.red),
        border: getOutlineInputBorder(color: AppColors.borderFieldColor),
        focusedBorder: getOutlineInputBorder(
          color: AppColors.mainColor[70]!,
          borderWidth: 2,
        ),
        enabledBorder: getOutlineInputBorder(color: AppColors.borderFieldColor),
        errorBorder: getOutlineInputBorder(color: AppColors.red),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: AppColors.red,
          applyTextScaling: true,
        ),
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.gray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          disabledBackgroundColor: AppColors.black[30],
          foregroundColor: AppColors.white,
          textStyle: getTextStyle(
            fontWeight: FontWeight.w500,
          ).responsiveFont(context, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      dialogTheme: DialogThemeData(
        titleTextStyle: getTextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        contentTextStyle: getTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static InputBorder getOutlineInputBorder({
    required Color color,
    double? borderWidth,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: borderWidth ?? 1.5),
    );
  }

  static TextStyle getTextStyle({
    Color? color,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color ?? AppColors.white,
      fontSize: fontSize ?? 14,
      fontFamily: fontFamily ?? FontsName.poppinsFont,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
