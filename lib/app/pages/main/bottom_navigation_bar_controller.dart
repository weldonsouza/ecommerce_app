import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/constants.dart';
import 'bottom_navigation_bar_controller_view_model.dart';

class BottomNavigationBarController extends StatefulWidget {
  const BottomNavigationBarController({Key? key}) : super(key: key);

  static String get routeName => '/bottom_navigation';

  @override
  State<BottomNavigationBarController> createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    Intl.defaultLocale = "pt_BR";

    Provider.of<BottomNavigationBarProviderController>(context, listen: false).init(context);
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Constants.blackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
          child: BottomNavigationBar(
            currentIndex: bottomNavigationController.selectedIndex,
            onTap: bottomNavigationController.onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: const IconThemeData(color: Constants.textFieldDisable),
            selectedIconTheme: const IconThemeData(color: Constants.primaryColor),
            unselectedItemColor: Constants.textFieldDisable,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                tooltip: 'Home',
                icon: SvgPicture.asset(
                  bottomNavigationController.selectedIndex == 0
                      ? 'assets/icons/home.svg'
                      : 'assets/icons/home_outlined.svg',
                  width: 24,
                  height: 24,
                  color: bottomNavigationController.selectedIndex == 0
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                tooltip: 'Favorite',
                icon: SvgPicture.asset(
                  bottomNavigationController.selectedIndex == 1
                      ? 'assets/icons/favorite.svg'
                      : 'assets/icons/favorite_outlined.svg',
                  width: 24,
                  height: 24,
                  color: bottomNavigationController.selectedIndex == 1
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                tooltip: 'Search',
                icon: SvgPicture.asset(
                  bottomNavigationController.selectedIndex == 2
                      ? 'assets/icons/search.svg'
                      : 'assets/icons/search_outlined.svg',
                  width: 24,
                  height: 24,
                  color: bottomNavigationController.selectedIndex == 2
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Bag',
                tooltip: 'Bag',
                icon: SvgPicture.asset(
                  bottomNavigationController.selectedIndex == 3
                      ? 'assets/icons/shopping_bag.svg'
                      : 'assets/icons/shopping_bag_outlined.svg',
                  width: 24,
                  height: 24,
                  color: bottomNavigationController.selectedIndex == 3
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                tooltip: 'Profile',
                icon: SvgPicture.asset(
                  bottomNavigationController.selectedIndex == 4
                      ? 'assets/icons/person.svg'
                      : 'assets/icons/person_outlined.svg',
                  width: 24,
                  height: 24,
                  color: bottomNavigationController.selectedIndex == 4
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
            ],
          ),
        ),
      ),
      body: bottomNavigationController.pages[
        bottomNavigationController.selectedIndex
      ],
    );
  }
}
