import 'package:get_it/get_it.dart';

import '../api_client/wallpaper_api_client.dart';
import '../entities/wallpaper_search_response.dart';

abstract class WallpaperRepository{
  Future<WallpapperSearchResponse> getRelevanceWallpapers({required int page});
}

class WallpaperRepositoryImpl implements WallpaperRepository {
  final _apiClient = GetIt.instance<WallpaperApiClient>();

  @override
  Future<WallpapperSearchResponse> getRelevanceWallpapers({required int page}) {
    return _apiClient.getRelevanceWallpapers(page:page);
  }
}