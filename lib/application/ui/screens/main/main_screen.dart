import 'package:best_phone_wallpapers/application/resources/resources.dart';
import 'package:best_phone_wallpapers/application/ui/screens/main/main_cubit.dart';
import 'package:best_phone_wallpapers/application/ui/screens/main/main_cubit_state.dart';
import 'package:best_phone_wallpapers/application/ui/themes/app_text_style.dart';
import 'package:best_phone_wallpapers/application/ui/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/switch/custom_switch_widget.dart';
import '../../widgets/wallpaper_grid_view/wallpapper_grid_view_widget.dart';
import '../../widgets/wallpaper_list_view/wallpaper_list_view_widget.dart';
import '../image/image_cubit_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainCubitState>(
      listener: (context, state) {
        final exception = state.exception;
        if (exception != null && exception.asString().isNotEmpty) {
          DialogWidget.showSnackBar(
            context: context,
            text: exception.asString(),
          );
        } else if (state.setAsWallpaperType != SetAsWallpaperType.initial) {
          DialogWidget.showSnackBar(
            context: context,
            text: state.setAsWallpaperType.toString(),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: const [
                  _HeaderWidget(),
                  Expanded(
                    child: _BodyWidget(),
                  ),
                ],
              ),
            ),
          ),
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
    final cubit = context.read<MainCubit>();
    final wallpapers =
        context.select((MainCubit cubit) => cubit.state.wallpapers);
    final currentSwitchIndex =
        context.select((MainCubit cubit) => cubit.state.currentSwitchIndex);
    final child = currentSwitchIndex == 0
        ? WallpaperGridViewWidget(
            wallpapers: wallpapers,
            onNewIndex: cubit.loadMoreWallpapersAtIndex,
          )
        : WallpaperListViewWidget(
            wallpapers: wallpapers,
            downloadAndsetWallpaper: cubit.downloadAndsetWallpaper,
            onNewIndex: cubit.loadMoreWallpapersAtIndex,
          );
    return Stack(
      children: [
        wallpapers.isNotEmpty
            ? child
            : Center(
                child: Text(
                  'Empty',
                  style: AppTextStyle.header,
                ),
              ),
        const _LoadingWidget()
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
    final isLoading =
        context.select((MainCubit cubit) => cubit.state.isLoadingProgress);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const SizedBox.shrink();
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "Wallpapers",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyle.header,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Find the best wallpapers for you",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyle.regularRaleway12,
                  ),
                ),
              ],
            ),
          ),
          CustomSwitchWidget(
            left: SvgPicture.asset(
              AppIcons.grid,
            ),
            right: SvgPicture.asset(
              AppIcons.list,
            ),
            onToggle: cubit.toggleSwitchIndex,
          ),
        ],
      ),
    );
  }
}
