import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:best_phone_wallpapers/application/ui/screens/image/image_cubit.dart';
import 'package:best_phone_wallpapers/application/ui/screens/image/image_screen.dart';
import 'package:best_phone_wallpapers/application/ui/screens/main/main_cubit.dart';
import 'package:best_phone_wallpapers/application/ui/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ScreenFactory {
  Widget makeMain();
  Widget makeImage(WallpapperResponse wallpaper);
}

class ScreenFactoryImpl implements ScreenFactory {
  @override
  Widget makeMain() {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MainScreen(),
    );
  }

  @override
  Widget makeImage(WallpapperResponse wallpaper) {
    return BlocProvider(
      create: (context) => ImageCubit(wallpaper),
      child: const ImageScreen(),
    );
  }
}
