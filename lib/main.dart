import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'shared/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.expense,
      routes: AppRoutes.routes,
      theme: AppTheme.lighTheme,
    );
  }
}
