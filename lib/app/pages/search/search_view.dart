import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

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
      appBar: CustomAppBar(
        context,
        title: 'Search',
        isBackButtonVisible: true,
        widget: Container(
          width: 40,
          height: 40,
          child: CustomIconButton(
            widget: Icon(
              Icons.tune_outlined,
              size: 20,
              color: Constants.blackColor,
            ),
            color: Constants.primaryColor.withOpacity(0.3),
            onTap: () {},
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
