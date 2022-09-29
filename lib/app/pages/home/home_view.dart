import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static String get routeName => '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
