import 'package:flutter/foundation.dart';

import '../../../domain/api_client/api_client_exception.dart';
import '../../../domain/entities/wallpaper_response.dart';
import '../image/image_cubit_state.dart';

class MainCubitState {
  final List<WallpapperResponse> wallpapers;
  final bool isLoadingProgress;
  final ApiClientException? exception;
  final int currentPage;
  final int totalPage;
  final int currentSwitchIndex;
  final SetAsWallpaperType setAsWallpaperType;

  MainCubitState({
    required this.wallpapers,
    this.isLoadingProgress = false,
    this.exception,
    this.currentPage = 0,
    this.totalPage = 1,
    this.currentSwitchIndex = 0,
    this.setAsWallpaperType = SetAsWallpaperType.initial,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MainCubitState &&
      listEquals(other.wallpapers, wallpapers) &&
      other.isLoadingProgress == isLoadingProgress &&
      other.exception == exception &&
      other.currentPage == currentPage &&
      other.totalPage == totalPage &&
      other.currentSwitchIndex == currentSwitchIndex &&
      other.setAsWallpaperType == setAsWallpaperType;
  }

  @override
  int get hashCode {
    return wallpapers.hashCode ^
      isLoadingProgress.hashCode ^
      exception.hashCode ^
      currentPage.hashCode ^
      totalPage.hashCode ^
      currentSwitchIndex.hashCode ^
      setAsWallpaperType.hashCode;
  }

  MainCubitState copyWith({
    List<WallpapperResponse>? wallpapers,
    bool? isLoadingProgress,
    ApiClientException? exception,
    int? currentPage,
    int? totalPage,
    int? currentSwitchIndex,
    SetAsWallpaperType? setAsWallpaperType,
  }) {
    return MainCubitState(
      wallpapers: wallpapers ?? this.wallpapers,
      isLoadingProgress: isLoadingProgress ?? this.isLoadingProgress,
      exception: exception,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      currentSwitchIndex: currentSwitchIndex ?? this.currentSwitchIndex,
      setAsWallpaperType: setAsWallpaperType ?? this.setAsWallpaperType,
    );
  }
}
