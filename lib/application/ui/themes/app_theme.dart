import 'package:best_phone_wallpapers/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.light().copyWith(
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: _lightColorScheme.background,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: _lightColorScheme.onBackground,
    ),
    useMaterial3: true,
  );

  static const _lightColorScheme = ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.colorPrimary,
        onPrimary: AppColors.colorOnPrimary,
        secondary: AppColors.colorGreySoft1,
        onSecondary: AppColors.colorOnSecondary,
        error: Colors.redAccent,
        onError: Colors.black,
        background: AppColors.colorWhite,
        onBackground: AppColors.colorGreyDark,
        surface: AppColors.colorGreySoft1,
        onSurface: AppColors.colorOnSurface,
      );
}
