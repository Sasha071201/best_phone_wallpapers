import 'package:best_phone_wallpapers/application/domain/entities/date_parser.dart';
import 'package:best_phone_wallpapers/application/resources/resources.dart';
import 'package:best_phone_wallpapers/application/ui/screens/image/image_cubit.dart';
import 'package:best_phone_wallpapers/application/ui/screens/image/image_cubit_state.dart';
import 'package:best_phone_wallpapers/application/ui/themes/app_colors.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/app_text_style.dart';
import '../../widgets/cached_network_image_widget.dart';
import '../../widgets/dialog_widget.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageCubit, ImageCubitState>(
      listener: (context, state) {
        if (state.setAsWallpaperType != SetAsWallpaperType.initial) {
          DialogWidget.showSnackBar(
            context: context,
            text: state.setAsWallpaperType.toString(),
          );
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: _BodyWidget(),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        Positioned.fill(
          child: _ImageWidget(),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: _BackButtonWidget(),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: _BottomWidget(),
        ),
        _LoadingWidget(),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallpaper =
        context.select((ImageCubit cubit) => cubit.state.wallpaper);
    return wallpaper == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const SizedBox.shrink();
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _InfoWidget(),
        SizedBox(height: 10),
        _DownloadAndSetWallpaperButtonWidget(),
      ],
    );
  }
}

class _DownloadAndSetWallpaperButtonWidget extends StatelessWidget {
  const _DownloadAndSetWallpaperButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ImageCubit>();
    final wallpapper = cubit.state.wallpaper;
    final isLoading = context.select(
      (ImageCubit cubit) => cubit.state.isLoading,
    );
    final isDownloaded = context.select(
      (ImageCubit cubit) => cubit.state.isEnabledSetWallpaper,
    );
    return wallpapper == null
        ? const SizedBox.shrink()
        : ElevatedButtonWidget(
            onPressed: () => isDownloaded
                ? cubit.setWallpaper(context)
                : cubit.downloadImage(wallpapper),
            maxHeight: 63,
            maxWidth: 278,
            child: isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.colorWhite,
                  )
                : Text(isDownloaded ? 'Set as wallpaper' : 'Download'),
          );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallpaper =
        context.select((ImageCubit cubit) => cubit.state.wallpaper);
    return wallpaper == null
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 17,
              top: 18.5,
            ),
            decoration: BoxDecoration(
              color: AppColors.colorGreySoft1WithOpacity80,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 10),
                _WallpaperInfoItemWidget(
                  icon: AppIcons.date,
                  text: stringFromDate(wallpaper.createdAt),
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

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallpaper =
        context.select((ImageCubit cubit) => cubit.state.wallpaper);
    return wallpaper == null
        ? const SizedBox.shrink()
        : InteractiveViewer(
            minScale: 0.1,
            maxScale: 10,
            child: CachedNetworkImageWidget(
              imageUrl: wallpaper.thumbs.large,
              height: 100,
              width: 200,
              fit: BoxFit.contain,
            ),
          );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonWidget(
      maxHeight: 50,
      maxWidth: 50,
      overlayColor: AppColors.colorSplash2,
      backgroundColor: Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(100),
      onPressed: () => Navigator.pop(context),
      child: SvgPicture.asset(AppIcons.arrowBack),
    );
  }
}
