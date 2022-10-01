import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  static String get routeName => '/bag';

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Bag',
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
