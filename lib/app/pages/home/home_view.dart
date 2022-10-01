import 'package:ecommerce_app/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      /*appBar: AppBar(
        backgroundColor: Constants.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Container(
            width: 28,
            height: 28,
            margin: EdgeInsets.only(right: 16),
            child: CustomIconButton(
              widget: Icon(Icons.notifications, size: 20),
              color: Constants.primaryColor.withOpacity(0.3),
            ),
          ),
        ],
      ),*/
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 40, right: 16),
                child: CustomIconButton(
                  widget: Icon(Icons.notifications, size: 20),
                  color: Constants.primaryColor.withOpacity(0.3),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
