import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:best_phone_wallpapers/application/ui/navigation/screen_names.dart';
import 'package:best_phone_wallpapers/application/ui/themes/app_colors.dart';
import 'package:best_phone_wallpapers/application/ui/themes/app_text_style.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/cached_network_image_widget.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/elevated_button_widget.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/inkwell_material_widget.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/wallpaper_list_view/wallpaper_list_view_widget.dart';

import '../../../domain/entities/date_parser.dart';
import '../../../resources/resources.dart';
import '../wallpaper_info/genre_widget.dart';
import '../wallpaper_info/likes_widget.dart';

class WallpaperListItemWidget extends StatelessWidget {
  final WallpapperResponse wallpaper;
  final int index;
  final Future<void> Function(BuildContext context, int index)
      downloadAndsetWallpaper;

  const WallpaperListItemWidget({
    Key? key,
    required this.wallpaper,
    required this.index,
    required this.downloadAndsetWallpaper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 130,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.colorGreySoft1,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          _LeftSideWidget(wallpaper),
          const SizedBox(width: 10),
          Expanded(
            child: _RightSideWidget(
              wallpaper: wallpaper,
              index: index,
              downloadAndsetWallpaper: downloadAndsetWallpaper,
            ),
          )
        ],
      ),
    );
  }
}

class _RightSideWidget extends StatelessWidget {
  final WallpapperResponse wallpaper;
  final int index;
  final Future<void> Function(BuildContext context, int index)
      downloadAndsetWallpaper;

  const _RightSideWidget({
    Key? key,
    required this.wallpaper,
    required this.index,
    required this.downloadAndsetWallpaper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _WallpaperInfoItemWidget(
                icon: AppIcons.resolution,
                text: wallpaper.resolution,
              ),
              const SizedBox(width: 10),
              _WallpaperInfoItemWidget(
                icon: AppIcons.download,
                text: wallpaper.fileSize,
              ),
            ],
          ),
          const Spacer(),
          if (wallpaper.createdAt != null) ...[
            _WallpaperInfoItemWidget(
              icon: AppIcons.date,
              text: stringFromDate(wallpaper.createdAt),
            ),
            const Spacer(),
          ],
          ElevatedButtonWidget(
            onPressed: () => downloadAndsetWallpaper(context, index),
            child: Text(
              'Set as wallpaper',
              style: AppTextStyle.button.copyWith(
                color: AppColors.colorOnPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WallpaperInfoItemWidget extends StatelessWidget {
  final String icon;
  final String text;

  const _WallpaperInfoItemWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 12,
          height: 12,
          color: AppColors.colorOnSecondary,
        ),
        const SizedBox(width: 2),
        Text(
          text,
          style: AppTextStyle.mediumMontserrat14.copyWith(
            color: AppColors.colorOnSecondary,
          ),
        ),
      ],
    );
  }
}

class _LeftSideWidget extends StatelessWidget {
  final WallpapperResponse wallpaper;
  const _LeftSideWidget(
    this.wallpaper, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellMaterialWidget(
      onTap: () => onWallpaperTap(context),
      color: AppColors.colorSplash1!,
      borderRadius: 15,
      child: Stack(
        children: [
          _ImageWidget(wallpaper.thumbs.small),
          Positioned(
            bottom: 8,
            left: 3,
            right: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 44,
                  child: LikesWidget(
                    likes: wallpaper.favorites,
                    isBlured: wallpaper.thumbs.small.isNotEmpty,
                  ),
                ),
                const Spacer(flex: 2),
                Flexible(
                  flex: 67,
                  child: GenreWidget(
                    genre: wallpaper.category,
                    isBlured: wallpaper.thumbs.small.isNotEmpty,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onWallpaperTap(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenNames.image, arguments: wallpaper);
  }
}

class _ImageWidget extends StatelessWidget {
  final String image;
  const _ImageWidget(
    this.image, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImageWidget(
        imageUrl: image,
        width: 116,
        height: 113,
      ),
    );
  }
}
