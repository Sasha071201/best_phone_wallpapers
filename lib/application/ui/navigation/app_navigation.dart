import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:best_phone_wallpapers/application/ui/navigation/screen_names.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../factories/screen_factory.dart';

abstract class AppNavigation {
  String get initial;
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class AppNavigationImpl implements AppNavigation {
  final ScreenFactory screenFactory = GetIt.instance<ScreenFactory>();

  AppNavigationImpl();

  @override
  String get initial => ScreenNames.main;

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenNames.main:
        return _getScreenRoute(screenFactory.makeMain());
      case ScreenNames.image:
        final wallpaper = settings.arguments as WallpapperResponse;
        return _getScreenRoute(screenFactory.makeImage(wallpaper));
      default:
        return _getScreenRoute(
          const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
    }
  }

  Route<Object> _getScreenRoute(Widget child) => MaterialPageRoute(
        builder: (BuildContext context) => child,
      );
}
