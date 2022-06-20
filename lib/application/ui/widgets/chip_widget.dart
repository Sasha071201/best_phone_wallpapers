import 'dart:ui';

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ChipWidget extends StatelessWidget {
  final Widget child;
  final bool isBlured;

  const ChipWidget({
    Key? key,
    required this.child,
    this.isBlured = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sigma = isBlured ? 3.0 : 0.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ColoredBox(
        color: AppColors.color234F68WithOpacity67,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
