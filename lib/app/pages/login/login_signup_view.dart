import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import 'login_view_model.dart';

class LoginSignupView extends StatefulWidget {
  const LoginSignupView({Key? key}) : super(key: key);

  static String get routeName => '/loginSignup';

  @override
  _LoginSignupViewState createState() => _LoginSignupViewState();
}

class _LoginSignupViewState extends State<LoginSignupView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    Provider.of<LoginProviderController>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var loginController = Provider.of<LoginProviderController>(context);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Constants.whiteColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Constants.surface,
            elevation: 0,
            iconTheme: const IconThemeData(color: Constants.blackColor),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ],
    );
  }
}
