import 'package:flutter/material.dart';

import 'package:best_phone_wallpapers/application/domain/entities/wallpaper_response.dart';

import 'wallpaper_list_item_widget.dart';

class WallpaperListViewWidget extends StatelessWidget {
  final List<WallpapperResponse> wallpapers;
  final void Function(int index) onNewIndex;
  final Future<void> Function(BuildContext context, int index)
      downloadAndsetWallpaper;

  const WallpaperListViewWidget({
    Key? key,
    required this.wallpapers,
    required this.onNewIndex,
    required this.downloadAndsetWallpaper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          onNewIndex(index);
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: WallpaperListItemWidget(
              wallpaper: wallpapers[index],
              index: index,
              downloadAndsetWallpaper: downloadAndsetWallpaper,
            ),
          );
        });
  }
}
