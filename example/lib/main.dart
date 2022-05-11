import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';
import 'transition_route_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: FlexThemeData.light(
              primary: AppColor.orange500,
              scaffoldBackground: Colors.white,
              appBarBackground: Colors.white,
              secondary: AppColor.orange500)
          .copyWith(
              inputDecorationTheme:
                  const InputDecorationTheme(fillColor: Colors.transparent)),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(
          primary: AppColor.orange500,
          scaffoldBackground: CupertinoColors.darkBackgroundGray,
          appBarBackground: CupertinoColors.darkBackgroundGray,
          secondary: AppColor.orange500),
      navigatorObservers: [TransitionRouteObserver()],
      themeMode: ThemeMode.system,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
