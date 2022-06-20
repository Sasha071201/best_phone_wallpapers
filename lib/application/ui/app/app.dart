import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import '../navigation/app_navigation.dart';
import '../themes/app_theme.dart';

class App extends StatelessWidget {
  final AppNavigation navigation = GetIt.instance<AppNavigation>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      title: 'Best Wallpapers',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      initialRoute: navigation.initial,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
