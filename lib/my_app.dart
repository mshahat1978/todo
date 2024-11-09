import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/config/theme/app_theme.dart';
import 'package:todo_app_c12_online_sun/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.homeRoute,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    );
  }
}
