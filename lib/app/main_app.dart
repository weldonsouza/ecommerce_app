import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../core/provider/provider_setup.dart';
import '../core/route/navigation_service.dart';
import '../core/utils/constants.dart';
import 'pages/bag/bag_page.dart';
import 'pages/favorite/favorite_page.dart';
import 'pages/home/home_page.dart';
import 'pages/introduction/introduction_page.dart';
import 'pages/login/forgot_password_page.dart';
import 'pages/login/login_signup_page.dart';
import 'pages/login/login_page.dart';
import 'pages/main/bottom_navigation_bar_controller_page.dart';
import 'pages/product/product_detail_page.dart';
import 'pages/profile/profile_edit_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/search/search_page.dart';
import 'pages/splash/splash_page.dart';

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
        home: const SplashPage(),
        routes: {
          IntroductionPage.routeName: (BuildContext context) => const IntroductionPage(),
          BottomNavigationBarControllerPage.routeName: (BuildContext context) => const BottomNavigationBarControllerPage(),
          SplashPage.routeName: (BuildContext context) => const SplashPage(),
          LoginPage.routeName: (BuildContext context) => const LoginPage(),
          LoginSignUpPage.routeName: (BuildContext context) => const LoginSignUpPage(),
          HomePage.routeName: (BuildContext context) => const HomePage(),
          ForgotPasswordPage.routeName: (BuildContext context) => const ForgotPasswordPage(),
          BagPage.routeName: (BuildContext context) => const BagPage(),
          SearchPage.routeName: (BuildContext context) => const SearchPage(),
          FavoritePage.routeName: (BuildContext context) => const FavoritePage(),
          ProfilePage.routeName: (BuildContext context) => const ProfilePage(),
          ProfileEditPage.routeName: (BuildContext context) => const ProfileEditPage(),
          ProductDetailPage.routeName: (BuildContext context) => const ProductDetailPage(),
        },
      ),
    );
  }
}
