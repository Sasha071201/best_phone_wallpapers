import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:best_phone_wallpapers/application/ui/widgets/switch/switch_notifier.dart';

import '../../themes/app_colors.dart';

class CustomSwitchWidget extends StatelessWidget {
  final Widget left;
  final Widget right;
  final void Function(int index) onToggle;
  final EdgeInsets itemPadding;
  final Size itemSize;
  final Duration animationDuration;
  final Curve curve;

  const CustomSwitchWidget({
    Key? key,
    required this.left,
    required this.right,
    required this.onToggle,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.itemSize = const Size(12, 12),
    this.animationDuration = const Duration(milliseconds: 70),
    this.curve = Curves.easeIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SwitchNotifier>(
      create: (context) => SwitchNotifier(0),
      builder: (context, child) => GestureDetector(
        onTap: () {
          final index = context.read<SwitchNotifier>().toggle();
          onToggle(index);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.colorGreySoft1,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _AnimatedActiveBackgroundWidget(
                  animationDuration: animationDuration,
                  curve: curve,
                  itemPadding: itemPadding,
                  itemSize: itemSize,
                ),
              ),
              Row(
                children: [
                  _ItemWidget(
                    animationDuration: animationDuration,
                    curve: curve,
                    itemPadding: itemPadding,
                    itemSize: itemSize,
                    index: 0,
                    child: left,
                  ),
                  const SizedBox(width: 5),
                  _ItemWidget(
                    animationDuration: animationDuration,
                    curve: curve,
                    itemPadding: itemPadding,
                    itemSize: itemSize,
                    index: 1,
                    child: right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final EdgeInsets itemPadding;
  final Size itemSize;
  final Widget child;
  final int index;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.itemPadding,
    required this.itemSize,
    required this.child,
    required this.index,
    required this.animationDuration,
    required this.curve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: itemPadding,
      child: SizedBox(
        height: itemSize.height,
        width: itemSize.width,
        child: _AnimatedItemWidget(
          animationDuration: animationDuration,
          curve: curve,
          index: index,
          child: child,
        ),
      ),
    );
  }
}

class _AnimatedItemWidget extends StatelessWidget {
  const _AnimatedItemWidget({
    Key? key,
    required this.child,
    required this.index,
    required this.animationDuration,
    required this.curve,
  }) : super(key: key);

  final Widget child;
  final int index;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<SwitchNotifier>().value;
    return AnimatedOpacity(
      opacity: index == currentIndex ? 1 : 0.5,
      curve: curve,
      duration: animationDuration,
      child: child,
    );
  }
}

class _AnimatedActiveBackgroundWidget extends StatelessWidget {
  final EdgeInsets itemPadding;
  final Size itemSize;
  final Duration animationDuration;
  final Curve curve;

  const _AnimatedActiveBackgroundWidget({
    Key? key,
    required this.itemPadding,
    required this.itemSize,
    required this.animationDuration,
    required this.curve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = context.watch<SwitchNotifier>().value;
    return AnimatedAlign(
      duration: animationDuration,
      curve: curve,
      alignment: index == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: itemPadding,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: SizedBox(
          width: itemSize.width,
          height: itemSize.height,
        ),
      ),
    );
  }
}
