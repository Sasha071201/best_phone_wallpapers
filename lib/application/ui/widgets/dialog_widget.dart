import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';

class DialogWidget {
  
  static void showSnackBar({
    required BuildContext context,
    required String text,
    Duration duration = const Duration(milliseconds: 5000),
    Color backgroundColor = AppColors.colorPrimary,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: AppTextStyle.button.copyWith(
            color: AppColors.colorOnPrimary,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}
