import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_style.dart';
import '../chip_widget.dart';

class GenreWidget extends StatelessWidget {
  final bool isBlured;
  final String genre;

  const GenreWidget({
    Key? key,
    this.isBlured = true,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChipWidget(
        isBlured: isBlured,
        child: Text(
          genre,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextStyle.mediumMontserrat12.copyWith(
            color: AppColors.colorWhite,
          ),
        ));
  }
}
