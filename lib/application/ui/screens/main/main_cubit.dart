import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:best_phone_wallpapers/application/domain/repository/wallpaper_repository.dart';
import 'package:wallpaper/wallpaper.dart';

import '../../../domain/api_client/api_client_exception.dart';
import '../image/image_cubit_state.dart';
import 'main_cubit_state.dart';

class MainCubit extends Cubit<MainCubitState> {
  final _repository = GetIt.instance<WallpaperRepository>();

  MainCubit()
      : super(
          MainCubitState(
            wallpapers: [],
          ),
        ) {
    _loadWallpappers();
  }

  Future<void> downloadAndsetWallpaper(BuildContext context, int index) async {
    var newState = state;
    newState =
        newState.copyWith(setAsWallpaperType: SetAsWallpaperType.initial);
    emit(newState);

    try {
      await _download(index);

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
    emit(newState);
  }

  Future<void> _download(int index) async {
    final wallpapper = state.wallpapers[index];
    final progress = Wallpaper.imageDownloadProgress(wallpapper.thumbs.large);
    final progressState = state.copyWith(isLoadingProgress: true);
    emit(progressState);
    final completer = Completer<bool>();
    final subscription = progress.listen(
      (data) {},
      onDone: () async {
        completer.complete(true);
      },
      onError: (error) {
        completer.complete(false);
      },
    );
    await completer.future;
    subscription.cancel();
    final newState = state.copyWith(isLoadingProgress: false);
    emit(newState);
  }

  Future<void> _loadWallpappers() async {
    if (state.isLoadingProgress || state.currentPage >= state.totalPage) return;
    final newLoadingState = state.copyWith(
      isLoadingProgress: true,
      exception: null,
      setAsWallpaperType: SetAsWallpaperType.initial,
    );
    emit(newLoadingState);
    final nextPage = state.currentPage + 1;

    try {
      await _fetchWallpappers(nextPage);
    } on ApiClientException catch (e) {
      final newErrorState = state.copyWith(
        isLoadingProgress: false,
        exception: e,
      );
      emit(newErrorState);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> _fetchWallpappers(int nextPage) async {
    final response = await _repository.getRelevanceWallpapers(
      page: nextPage,
    );
    final newListWallpapers = List<WallpapperResponse>.from(state.wallpapers);
    newListWallpapers.addAll(response.data);
    final newState = state.copyWith(
      currentPage: response.meta.currentPage,
      totalPage: response.meta.total,
      wallpapers: newListWallpapers,
      isLoadingProgress: false,
    );
    emit(newState);
  }

  void loadMoreWallpapersAtIndex(int index) {
    if (index < state.wallpapers.length - 1) return;
    _loadWallpappers();
  }

  void toggleSwitchIndex(int index) {
    if (index == state.currentSwitchIndex) return;
    final newState = state.copyWith(
      currentSwitchIndex: index,
      setAsWallpaperType: SetAsWallpaperType.initial,
    );
    emit(newState);
  }
}
