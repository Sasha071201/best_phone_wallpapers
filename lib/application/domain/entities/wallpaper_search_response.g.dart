// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallpapperSearchResponse _$WallpapperSearchResponseFromJson(
        Map<String, dynamic> json) =>
    WallpapperSearchResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => WallpapperResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WallpapperSearchResponseToJson(
        WallpapperSearchResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      query: json['query'] as String?,
      seed: json['seed'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'query': instance.query,
      'seed': instance.seed,
    };
