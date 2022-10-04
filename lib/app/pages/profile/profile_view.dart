import 'package:ecommerce_app/app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/cliprrect_photo_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../main/bottom_navigation_bar_controller.dart';
import '../main/bottom_navigation_bar_controller_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  static String get routeName => '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(context, title: 'Profile', isBackButtonVisible: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(color: Constants.blackColor),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRectPhotoWidget(
                    photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    color: Constants.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Rafael Silva',
              style: GoogleFonts.poppins(
                color: Constants.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'rafael.silva@gmail.com',
              style: GoogleFonts.poppins(
                color: Constants.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 28),
              child: CustomElevatedButton(
                labelText: 'Edit Profile',
                width: Utils.mediaQuery(context, 0.34),
                height: 34,
                onTap: () {},
              ),
            ),
            Container(
              width: Utils.mediaQuery(context, 1),
              height: 1,
              color: Constants.textFieldDisable,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            ),
            _cardView(Icons.settings_outlined, 'Settings'),
            _cardView(Icons.assignment_outlined, 'My Orders'),
            _cardView(Icons.contact_mail_outlined, 'Address'),
            _cardView(Icons.lock_outline, 'Change Password'),
            Container(
              width: Utils.mediaQuery(context, 1),
              height: 1,
              color: Constants.textFieldDisable,
              margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
            ),
            _cardView(Icons.help_outline, 'Help & Support'),
            _cardView(Icons.lock_outline, 'Privacy Policy'),
            _cardView(Icons.lock_outline, 'Terms of Use'),
            _cardView(Icons.logout, 'Logout'),
            SizedBox(height: 96),
          ],
        ),
      ),
    );
  }

  _cardView(icon, title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              'assets/icons/facebook.svg',
            ),
          ),*/
          Row(
            children: [
              Icon(
                icon,
                size: 24,
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Constants.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
