import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallpaper_search_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WallpapperSearchResponse {
  final List<WallpapperResponse> data;
  final Meta meta;
  WallpapperSearchResponse({
    required this.data,
    required this.meta,
  });

  Map<String, dynamic> toJson() => _$WallpapperSearchResponseToJson(this);

  factory WallpapperSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$WallpapperSearchResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Meta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final String? query;
  final String? seed;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.query,
    required this.seed,
  });

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);
}
