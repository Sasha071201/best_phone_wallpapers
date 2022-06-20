import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';

enum SetAsWallpaperType {
  success,
  failure,
  initial;

  @override
  String toString() {
    switch (this) {
      case SetAsWallpaperType.success:
        return 'Successfully installed new wallpaper';
      case SetAsWallpaperType.failure:
        return 'An error occurred while installing new wallpaper';
      case SetAsWallpaperType.initial:
        return '';
    }
  }
}

class ImageCubitState {
  final WallpapperResponse? wallpaper;
  final bool isEnabledSetWallpaper;
  final bool isLoading;
  final SetAsWallpaperType setAsWallpaperType;

  ImageCubitState({
    required this.wallpaper,
    this.isEnabledSetWallpaper = false,
    this.isLoading = false,
    this.setAsWallpaperType = SetAsWallpaperType.initial,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ImageCubitState &&
      other.wallpaper == wallpaper &&
      other.isEnabledSetWallpaper == isEnabledSetWallpaper &&
      other.isLoading == isLoading &&
      other.setAsWallpaperType == setAsWallpaperType;
  }

  @override
  int get hashCode {
    return wallpaper.hashCode ^
      isEnabledSetWallpaper.hashCode ^
      isLoading.hashCode ^
      setAsWallpaperType.hashCode;
  }

  ImageCubitState copyWith({
    WallpapperResponse? wallpaper,
    bool? isEnabledSetWallpaper,
    bool? isLoading,
    SetAsWallpaperType? setAsWallpaperType,
  }) {
    return ImageCubitState(
      wallpaper: wallpaper ?? this.wallpaper,
      isEnabledSetWallpaper: isEnabledSetWallpaper ?? this.isEnabledSetWallpaper,
      isLoading: isLoading ?? this.isLoading,
      setAsWallpaperType: setAsWallpaperType ?? this.setAsWallpaperType,
    );
  }
}
