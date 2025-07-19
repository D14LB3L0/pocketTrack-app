import 'package:flutter/material.dart';

import '../screens/screens.dart';

class Routes {
  static const String home = 'home';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
  };
}
