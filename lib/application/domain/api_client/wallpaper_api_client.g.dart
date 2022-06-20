// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WallpaperClientImpl implements WallpaperClientImpl {
  _WallpaperClientImpl(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://wallhaven.cc/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WallpapperSearchResponse> getRelevanceWallpapers(
      {required page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WallpapperSearchResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search?{page}&sorting=relevance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WallpapperSearchResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
