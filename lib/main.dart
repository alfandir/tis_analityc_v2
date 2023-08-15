import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tis_analytic/common/colors.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/provider/auth_provider.dart';
import 'package:tis_analytic/screens/auth/login_screen.dart';
import 'package:tis_analytic/screens/home/home_screen.dart';

import 'common/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  await Hive.initFlutter();
  await Hive.openBox(boxUser);
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: GetMaterialApp(
        title: 'TIS Analytic',
        theme: PoppinsTheme.lightTheme(),
        darkTheme: PoppinsTheme.darkTheme(),
        builder: EasyLoading.init(),
        themeMode: ThemeMode.light,
        home: (Hive.box(boxUser).get('isLogin') ?? false)
            ? const HomeScreen()
            : const LoginScreen(),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..radius = 10
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.grey[100]?.withOpacity(0.8)
    ..indicatorColor = basicColor
    ..textColor = Colors.white
    // ..textStyle = Theme.body.copyWith(color: Helper.basicColor)
    ..successWidget = const Icon(
      Icons.check_circle,
      color: basicColor,
      size: 45,
    )
    ..errorWidget = const Icon(
      Icons.warning_outlined,
      color: redColor,
      size: 45,
    )
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..userInteractions = false
    ..dismissOnTap = false;
}
