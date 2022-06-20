import 'package:best_phone_wallpapers/application/configuration/network_configuration.dart';
import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_search_response.dart';
import 'package:get_it/get_it.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'wallpaper_api_client.g.dart';

abstract class WallpaperApiClient {
  Future<WallpapperSearchResponse> getRelevanceWallpapers({required int page});
}

@RestApi(baseUrl: NetworkConfiguration.host)
abstract class WallpaperClientImpl implements WallpaperApiClient {
  factory WallpaperClientImpl() {
    final dio = GetIt.instance<Dio>();
    return _WallpaperClientImpl(dio);
  }

  @override
  @GET("/search?{page}&sorting=relevance")
  Future<WallpapperSearchResponse> getRelevanceWallpapers({
    @Query('page') required int page,
  });
}
