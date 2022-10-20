import 'package:ecommerce_app/app/pages/introduction/components/custom_introduction_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../login/login_page.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  static String get routeName => '/introduction';

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  String text = 'Next';

  List<Widget> pages = [
    CustomIntroductionWidget(
      imageBackground: 'background1',
      title: 'Explore the best products',
      subTitle: 'Get the decibels delivered to your ears perfectly.',
    ),
    CustomIntroductionWidget(
      imageBackground: 'background2',
      title: 'Explore the best products',
      subTitle: 'Get the decibels delivered to your ears perfectly.',
    ),
    CustomIntroductionWidget(
      imageBackground: 'background3',
      title: 'Explore the best products',
      subTitle: 'Get the decibels delivered to your ears perfectly.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemCount: pages.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int page) {
              text = page == 2 ? 'Get started' : 'Next';
              setState(() {});
            },
            itemBuilder: (_, index) {
              return pages[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Constants.whiteColor,
                      dotColor: Constants.textColor,
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 8,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Constants.blackColor),
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.whiteColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);

                      if(text == 'Get started') {
                        navigationService.pushReplacement(LoginPage.routeName);
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 12),
                          child: Text(
                            text,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Constants.blackColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}