import 'package:flutter/material.dart';

import 'package:best_phone_wallpapers/application/ui/widgets/wallpaper_grid_view/wallpaper_grid_item_widget.dart';

import '../../../domain/entities/wallpaper_response.dart';
import '../grid_view_widget.dart';

class WallpaperGridViewWidget extends StatelessWidget {
  final List<WallpapperResponse> wallpapers;
  final void Function(int index) onNewIndex;

  const WallpaperGridViewWidget({
    Key? key,
    required this.wallpapers,
    required this.onNewIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewWidget(
      itemBuilder: (context, index) {
        onNewIndex(index);
        return WallpaperGridItemWidget(wallpapers[index]);
      },
      itemCount: wallpapers.length,
    );
  }
}
