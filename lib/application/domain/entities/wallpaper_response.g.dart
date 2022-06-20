// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallpapperResponse _$WallpapperResponseFromJson(Map<String, dynamic> json) =>
    WallpapperResponse(
      id: json['id'] as String,
      url: json['url'] as String,
      shortUrl: json['short_url'] as String,
      views: json['views'] as int,
      favorites: json['favorites'] as int,
      source: json['source'] as String,
      purity: json['purity'] as String,
      category: json['category'] as String,
      dimensionX: json['dimension_x'] as int,
      dimensionY: json['dimension_y'] as int,
      resolution: json['resolution'] as String,
      ratio: json['ratio'] as String,
      fileSize: parseByteToString(json['file_size'] as int),
      fileType: json['file_type'] as String,
      createdAt: parseDateFromString(json['created_at'] as String?),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      path: json['path'] as String,
      thumbs: Thumbs.fromJson(json['thumbs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WallpapperResponseToJson(WallpapperResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'short_url': instance.shortUrl,
      'views': instance.views,
      'favorites': instance.favorites,
      'source': instance.source,
      'purity': instance.purity,
      'category': instance.category,
      'dimension_x': instance.dimensionX,
      'dimension_y': instance.dimensionY,
      'resolution': instance.resolution,
      'ratio': instance.ratio,
      'file_size': instance.fileSize,
      'file_type': instance.fileType,
      'created_at': instance.createdAt?.toIso8601String(),
      'colors': instance.colors,
      'path': instance.path,
      'thumbs': instance.thumbs.toJson(),
    };

Thumbs _$ThumbsFromJson(Map<String, dynamic> json) => Thumbs(
      large: json['large'] as String,
      original: json['original'] as String,
      small: json['small'] as String,
    );

Map<String, dynamic> _$ThumbsToJson(Thumbs instance) => <String, dynamic>{
      'large': instance.large,
      'original': instance.original,
      'small': instance.small,
    };
