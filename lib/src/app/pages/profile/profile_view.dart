import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../main/bottom_navigation_bar_controller.dart';
import '../main/bottom_navigation_bar_controller_viewModel.dart';


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
      appBar: AppBar(
        backgroundColor: Constants.primaryColor3,
        elevation: 0,
        iconTheme: const IconThemeData(color: Constants.blackColor),
        title: Text(
          'Perfil',
          style: GoogleFonts.raleway(
            color: Constants.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Constants.whiteColor,
          ),
          onPressed: () {
            bottomNavigationController.onItemTapped(1);
            navigationService.push(BottomNavigationBarController.routeName);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [

          ],
        ),
      ),
    );
  }
}
