import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_style.dart';
import '../chip_widget.dart';

class LikesWidget extends StatelessWidget {
  final bool isBlured;
  final int likes;

  const LikesWidget({
    Key? key,
    this.isBlured = true,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likesString = likes > 9 ? '9+' : '$likes';
    return ChipWidget(
      isBlured: isBlured,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.like),
          const SizedBox(width: 1.32),
          Flexible(
            child: Text(
              likesString,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.mediumMontserrat12.copyWith(
                color: AppColors.colorWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
