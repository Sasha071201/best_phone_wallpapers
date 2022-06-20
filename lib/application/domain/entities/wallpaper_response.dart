import 'package:best_phone_wallpapers/application/domain/entities/byte_parser.dart';
import 'package:best_phone_wallpapers/application/domain/entities/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallpaper_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WallpapperResponse {
  final String id;
  final String url;
  final String shortUrl;
  final int views;
  final int favorites;
  final String source;
  final String purity;
  final String category;
  final int dimensionX;
  final int dimensionY;
  final String resolution;
  final String ratio;
  @JsonKey(fromJson: parseByteToString)
  final String fileSize;
  final String fileType;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? createdAt;
  final List<String> colors;
  final String path;
  final Thumbs thumbs;
  WallpapperResponse({
    required this.id,
    required this.url,
    required this.shortUrl,
    required this.views,
    required this.favorites,
    required this.source,
    required this.purity,
    required this.category,
    required this.dimensionX,
    required this.dimensionY,
    required this.resolution,
    required this.ratio,
    required this.fileSize,
    required this.fileType,
    required this.createdAt,
    required this.colors,
    required this.path,
    required this.thumbs,
  });

    Map<String, dynamic> toJson() => _$WallpapperResponseToJson(this);

  factory WallpapperResponse.fromJson(Map<String, dynamic> json) =>
      _$WallpapperResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Thumbs {
  final String large;
  final String original;
  final String small;

  Thumbs({
    required this.large,
    required this.original,
    required this.small,
  });

      Map<String, dynamic> toJson() => _$ThumbsToJson(this);

  factory Thumbs.fromJson(Map<String, dynamic> json) =>
      _$ThumbsFromJson(json);
}