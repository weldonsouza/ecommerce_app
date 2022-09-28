import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/constants.dart';
import 'introduction_view_model.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({Key? key}) : super(key: key);

  static String get routeName => '/introduction';

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  List<Widget> pages = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/background1.jpg"),
          fit: BoxFit.fill,
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
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background/background3.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var introductionController = Provider.of<IntroductionProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemCount: pages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return pages[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Explored The Best Products',
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
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
                  Row(
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
                          //verticalOffset: 50,
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
                        onPressed: () => {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 12),
                              child: Text(
                                'Get started',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Constants.blackColor, size: 16),
                          ],
                        ),
                      ),
                    ],
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