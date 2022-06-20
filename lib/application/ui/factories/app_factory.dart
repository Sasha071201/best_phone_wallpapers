import 'package:best_phone_wallpapers/application/ui/app/app.dart';
import 'package:flutter/material.dart';

abstract class AppFactory {
  Widget makeApp();
}

class AppFactoryImpl implements AppFactory {
  @override
  Widget makeApp() => App();
}
