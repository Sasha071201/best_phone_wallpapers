import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/inkwell_material_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:best_phone_wallpapers/application/ui/themes/app_colors.dart';

import '../../../resources/resources.dart';
import '../../navigation/screen_names.dart';
import '../../themes/app_text_style.dart';
import '../cached_network_image_widget.dart';
import '../wallpaper_info/genre_widget.dart';
import '../wallpaper_info/likes_widget.dart';

class WallpaperGridItemWidget extends StatelessWidget {
  final WallpapperResponse wallpaper;
  const WallpaperGridItemWidget(
    this.wallpaper, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellMaterialWidget(
      onTap: () => onWallpaperTap(context),
      borderRadius: 25,
      color: AppColors.colorSplash1!,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.colorGreySoft1,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                _ImageWidget(wallpaper.thumbs.small),
                _InfoOnImageWidget(wallpaper),
              ],
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void onWallpaperTap(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenNames.image, arguments: wallpaper);
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
          width: 9,
          height: 9,
          color: AppColors.colorOnSecondary,
        ),
        const SizedBox(width: 2),
        Text(
          text,
          style: AppTextStyle.boldMontserrat10.copyWith(
            color: AppColors.colorOnSecondary,
          ),
        ),
      ],
    );
  }
}

class _InfoOnImageWidget extends StatelessWidget {
  final WallpapperResponse wallpaper;
  const _InfoOnImageWidget(
    this.wallpaper, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 9,
      right: 9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
            flex: 85,
            child: GenreWidget(
              genre: wallpaper.category,
              isBlured: wallpaper.thumbs.small.isNotEmpty,
            ),
          ),
        ],
      ),
    );
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
        width: 144,
        height: 160,
      ),
    );
  }
}
