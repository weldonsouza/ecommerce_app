import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  static String get routeName => '/search';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
          'Search',
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
