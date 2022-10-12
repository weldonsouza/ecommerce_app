import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/route/navigation_service.dart';
import '../../core/utils/constants.dart';
import '../pages/main/bottom_navigation_bar_controller_page.dart';
import '../pages/main/bottom_navigation_bar_controller.dart';
import 'custom_icon_button.dart';

AppBar CustomAppBar(BuildContext context, {required String title, required bool isBackButtonVisible, Function()? onTapButtonBack, Widget? widget}) {
  var bottomNavigationController = Provider.of<BottomNavigationBarController>(context);

  return AppBar(
    backgroundColor: Constants.whiteColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Constants.blackColor),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        isBackButtonVisible == true
            ? Container(
                width: 40,
                height: 40,
                child: CustomIconButton(
                  widget: Icon(
                    Icons.arrow_back_outlined,
                    color: Constants.blackColor,
                  ),
                  color: Constants.primaryColor.withOpacity(0.3),
                  onTap: onTapButtonBack ?? () {
                    bottomNavigationController.onItemTapped(0);
                    navigationService.pushReplacement(BottomNavigationBarControllerPage.routeName);
                  },
                ),
              )
            : SizedBox(width: 40),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        widget ?? SizedBox(width: 40),
      ],
    ),
  );
}
