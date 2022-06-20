import 'package:flutter/cupertino.dart';

class SwitchNotifier extends ValueNotifier<int> {
  SwitchNotifier(super.value);

  int toggle() => value = value == 0 ? 1 : 0;
}
