import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/route/navigation_service.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';
import '../pages/main/bottom_navigation_bar_controller.dart';
import '../pages/main/bottom_navigation_bar_controller_view_model.dart';
import 'custom_elevated_button.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final String titleButton;
  final double widthButton;

  const CustomEmptyWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.titleButton,
    required this.widthButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/icons/$icon.svg',
            height: Utils.mediaQuery(context, 0.27, direction: 'H'),
          ),
          SizedBox(height: 28),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Constants.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Constants.textColor,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 96),
            child: CustomElevatedButton(
              labelText: titleButton,
              width: widthButton,
              height: 34,
              onTap: () {
                bottomNavigationController.onItemTapped(0);
                navigationService.pushReplacement(BottomNavigationBarController.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
