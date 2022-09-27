import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import 'introduction_viewModel.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({Key? key}) : super(key: key);

  static String get routeName => '/introduction';

  @override
  _IntroductionViewState createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var introductionController = Provider.of<IntroductionProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
