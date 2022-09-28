import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/constants.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({Key? key}) : super(key: key);

  static String get routeName => '/introduction';

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  final controller = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  String text = 'Next';

  List<Widget> pages = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/background1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 90),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Explore the best products',
                style: TextStyle(
                  color: Constants.whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 40),
                child: Text(
                  'Get the decibels delivered to your ears perfectly.',
                  style: TextStyle(
                    color: Constants.colorDivider,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/background2.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 90),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Explore the best products',
                style: TextStyle(
                  color: Constants.whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 40),
                child: Text(
                  'Get the decibels delivered to your ears perfectly.',
                  style: TextStyle(
                    color: Constants.colorDivider,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/background3.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 90),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Explore the best products',
                style: TextStyle(
                  color: Constants.whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 40),
                child: Text(
                  'Get the decibels delivered to your ears perfectly.',
                  style: TextStyle(
                    color: Constants.colorDivider,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    //var introductionController = Provider.of<IntroductionProviderController>(context);

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
                      dotColor: Constants.colorDivider,
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
                        const Icon(Icons.arrow_forward_ios, color: Constants.blackColor, size: 16),
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