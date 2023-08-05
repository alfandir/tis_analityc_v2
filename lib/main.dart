import 'package:flutter/material.dart';
import 'package:tis_analytic/login_screen.dart';

import 'common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIS Analytic',
      theme: PoppinsTheme.lightTheme(),
      darkTheme: PoppinsTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: const LoginScreen(),
    );
  }
}
