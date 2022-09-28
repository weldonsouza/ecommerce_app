import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../introduction/introduction_view.dart';
import '../login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String get routeName => '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    bool view = await Utils.setIntroduction();
    navigationService.pushReplacement(IntroductionView.routeName);
    /*Timer(const Duration(seconds: 3), () {
      if(view == false){
        navigationService.pushReplacement(IntroductionView.routeName);
      } else {
        navigationService.pushReplacement(LoginView.routeName);
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.customPrimaryColor.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: SizedBox(
            width: Utils.mediaQuery(context, 1),
            height: 200,
            child: SvgPicture.asset(
              'assets/logo_poman.svg',
              width: 200,
              color: Constants.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
