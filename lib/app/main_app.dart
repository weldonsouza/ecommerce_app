import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../core/provider/provider_setup.dart';
import '../core/route/navigation_service.dart';
import '../core/utils/constants.dart';
import 'pages/home/home_view.dart';
import 'pages/introduction/introduction_view.dart';
import 'pages/login/login_signup_view.dart';
import 'pages/login/login_view.dart';
import 'pages/main/bottom_navigation_bar_controller.dart';
import 'pages/splash/splash_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'E-commerce APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Constants.primaryColor,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Constants.customPrimaryColor,
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        navigatorKey: NavigationService.navigationKey,
        home: const SplashView(),
        routes: {
          IntroductionView.routeName: (BuildContext context) => const IntroductionView(),
          BottomNavigationBarController.routeName: (BuildContext context) => const BottomNavigationBarController(),
          SplashView.routeName: (BuildContext context) => const SplashView(),
          LoginView.routeName: (BuildContext context) => const LoginView(),
          LoginSignupView.routeName: (BuildContext context) => const LoginSignupView(),
          HomeView.routeName: (BuildContext context) => const HomeView(),
        },
      ),
    );
  }
}
