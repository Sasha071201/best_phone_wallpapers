import 'package:best_phone_wallpapers/application/domain/api_client/wallpaper_api_client.dart';
import 'package:best_phone_wallpapers/application/domain/api_client/api_client_exception.dart';
import 'package:best_phone_wallpapers/application/domain/repository/wallpaper_repository.dart';
import 'package:best_phone_wallpapers/application/ui/factories/app_factory.dart';
import 'package:best_phone_wallpapers/application/ui/factories/screen_factory.dart';
import 'package:best_phone_wallpapers/application/ui/navigation/app_navigation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setupGetIt() {
  GetIt.instance.registerFactory<AppFactory>(() => AppFactoryImpl());
  GetIt.instance.registerFactory<ScreenFactory>(() => ScreenFactoryImpl());
  GetIt.instance.registerFactory<AppNavigation>(() => AppNavigationImpl());

  GetIt.instance.registerFactory<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        final exception = ApiClientException(
          type: e.type,
          requestOptions: e.requestOptions,
          response: e.response,
          error: e.error,
        );
        handler.next(exception);
      },
    ));
    return dio;
  });
  
  GetIt.instance.registerFactory<WallpaperApiClient>(() => WallpaperClientImpl());

  GetIt.instance.registerFactory<WallpaperRepository>(() => WallpaperRepositoryImpl());
}
