import 'dart:async';
import 'dart:developer';

import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallpaper/wallpaper.dart';

import 'image_cubit_state.dart';

class ImageCubit extends Cubit<ImageCubitState> {
  ImageCubit(WallpapperResponse wallpapper)
      : super(
          ImageCubitState(
            wallpaper: wallpapper,
          ),
        );

  Future<void> setWallpaper(BuildContext context) async {
    var newState = state;
    try {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
      await Wallpaper.homeScreen(
        options: RequestSizeOptions.RESIZE_FIT,
        width: width,
        height: height,
      );
      newState =
          newState.copyWith(setAsWallpaperType: SetAsWallpaperType.success);
    } catch (e) {
      newState =
          newState.copyWith(setAsWallpaperType: SetAsWallpaperType.failure);
      log(e.toString());
    }
    newState = newState.copyWith(isLoading: false);
    emit(newState);
  }

  Future<void> downloadImage(WallpapperResponse wallpapper) async {
    final progress = Wallpaper.imageDownloadProgress(wallpapper.thumbs.large);
    final completer = Completer<bool>();
    final progressState = state.copyWith(isLoading: true);
    emit(progressState);
    final subscription = progress.listen(
      (data) {},
      onDone: () async {
        completer.complete(true);
      },
      onError: (error) {
        completer.complete(false);
      },
    );
    final isDownloadSuccessful = await completer.future;
    subscription.cancel();

    var newState = state.copyWith(isLoading: false);
    newState = newState.copyWith(isEnabledSetWallpaper: isDownloadSuccessful);
    emit(newState);
  }
}
