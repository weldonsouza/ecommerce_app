import 'package:flutter/material.dart';
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
        height: 64,
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
            //selectedItemColor: Constants.whiteColor,
            /*selectedLabelStyle: GoogleFonts.raleway(
              color: Constants.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: GoogleFonts.raleway(
              color: Constants.textFieldDisable,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            */
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: const IconThemeData(color: Constants.textFieldDisable),
            selectedIconTheme: const IconThemeData(color: Constants.primaryColor),
            unselectedItemColor: Constants.textFieldDisable,
            //iconSize: 24,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                tooltip: 'Home',
                icon: Icon(
                  bottomNavigationController.selectedIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  size: 24,
                  color: bottomNavigationController.selectedIndex == 0
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                tooltip: 'Favorite',
                icon: Icon(
                  bottomNavigationController.selectedIndex == 1
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 24,
                  color: bottomNavigationController.selectedIndex == 1
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                tooltip: 'Search',
                icon: Icon(
                  bottomNavigationController.selectedIndex == 2
                      ? Icons.search
                      : Icons.search_outlined,
                  size: 24,
                  color: bottomNavigationController.selectedIndex == 2
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Bag',
                tooltip: 'Bag',
                icon: Icon(
                  bottomNavigationController.selectedIndex == 3
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined,
                  size: 24,
                  color: bottomNavigationController.selectedIndex == 3
                      ? Constants.whiteColor
                      : Constants.textFieldDisable,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                tooltip: 'Profile',
                icon: Icon(
                  bottomNavigationController.selectedIndex == 4
                      ? Icons.person
                      : Icons.person_outline,
                  size: 24,
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
