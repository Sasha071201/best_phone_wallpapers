import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final double maxHeight;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Alignment? alignment;
  final BorderSide? borderSide;
  final EdgeInsets? padding;

  const ElevatedButtonWidget({
    Key? key,
    this.borderRadius,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight = 42.0,
    this.backgroundColor = AppColors.colorPrimary,
    this.overlayColor,
    this.gradient,
    required this.onPressed,
    required this.child,
    this.alignment,
    this.borderSide,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingResult = padding ?? EdgeInsets.zero;
    final overlayColorResult = overlayColor ?? AppColors.colorSplash1!;
    final borderRadiusResult = borderRadius ?? BorderRadius.circular(10);
    final borderSideResult =
        borderSide != null ? MaterialStateProperty.all(borderSide) : null;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minHeight: minHeight ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minWidth: minWidth ?? 0,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
          borderRadius: borderRadiusResult,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom().copyWith(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor:
                MaterialStateProperty.all(AppColors.colorOnPrimary),
            minimumSize: MaterialStateProperty.all(Size.zero),
            padding: MaterialStateProperty.all(paddingResult),
            side: borderSideResult,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadiusResult),
            ),
            overlayColor: MaterialStateProperty.all(overlayColorResult),
          ),
          child: Align(
            alignment: alignment ?? Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
