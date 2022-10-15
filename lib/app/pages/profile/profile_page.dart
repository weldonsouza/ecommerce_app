import 'package:ecommerce_app/app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/cliprrect_photo_widget.dart';
import '../../widgets/custom_elevated_button.dart';
import '../login/login_page.dart';
import '../main/bottom_navigation_bar_controller.dart';
import 'components/card_profile_widget.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static String get routeName => '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarController>(context);

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
              '@rafael',
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
                onTap: () {
                  navigationService.push(ProfileEditPage.routeName, arguments: {
                    'photo': 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    'name': 'Rafael Silva',
                    'email': '@rafael',
                  });
                },
              ),
            ),
            Container(
              width: Utils.mediaQuery(context, 1),
              height: 1,
              color: Constants.textFieldDisable,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            ),
            CardProfileWidget(
              iconSvg: 'settings',
              title: 'Settings',
              onTap: () {},
            ),
            CardProfileWidget(
              icon: Icons.assignment_outlined,
              title: 'My Orders',
              onTap: () {},
            ),
            CardProfileWidget(
              iconSvg: 'alternate_map',
              title: 'Address',
              onTap: () {},
            ),
            CardProfileWidget(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {},
            ),
            Container(
              width: Utils.mediaQuery(context, 1),
              height: 1,
              color: Constants.textFieldDisable,
              margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            ),
            CardProfileWidget(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            CardProfileWidget(
              icon: Icons.lock_outline,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            CardProfileWidget(
              icon: Icons.lock_outline,
              title: 'Terms of Use',
              onTap: () {},
            ),
            CardProfileWidget(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                navigationService.pushReplacement(LoginPage.routeName);
              },
            ),
            SizedBox(height: 96),
          ],
        ),
      ),
    );
  }
}
