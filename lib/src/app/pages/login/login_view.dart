import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import 'login_viewModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static String get routeName => '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var loginController = Provider.of<LoginProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
