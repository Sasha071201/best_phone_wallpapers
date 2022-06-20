import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application/di/di_container.dart';
import 'application/ui/factories/app_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  GoogleFonts.config.allowRuntimeFetching = false;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final appFactory = GetIt.instance<AppFactory>();
  final app = appFactory.makeApp();
  runApp(app);
}
