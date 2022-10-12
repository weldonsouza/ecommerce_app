import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../introduction/introduction_page.dart';
import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String get routeName => '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    bool view = await Utils.setIntroduction();

    Timer(const Duration(seconds: 3), () {
      if(view == false){
        navigationService.pushReplacement(IntroductionPage.routeName);
      } else {
        navigationService.pushReplacement(LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/headphone.svg',
            color: Constants.blackColor,
            width: 96,
            height: 96,
          ),
          SizedBox(width: Utils.mediaQuery(context, 1), height: 8),
          Text(
            'Headphones',
            style: GoogleFonts.poppins(
              color: Constants.blackColor,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
