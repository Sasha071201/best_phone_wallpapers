import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  const GridViewWidget({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      mainAxisSpacing: 8,
      crossAxisSpacing: 7,
      crossAxisCount: 2,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
