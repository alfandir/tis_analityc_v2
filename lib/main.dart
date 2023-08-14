import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/screens/auth/login_screen.dart';
import 'package:tis_analytic/screens/home/home_screen.dart';

import 'common/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(boxUser);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TIS Analytic',
      theme: PoppinsTheme.lightTheme(),
      darkTheme: PoppinsTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: (Hive.box(boxUser).get('isLogin') ?? false)
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
