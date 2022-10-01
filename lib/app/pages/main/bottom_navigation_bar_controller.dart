import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    Intl.defaultLocale = "pt_BR";

    Provider.of<BottomNavigationBarProviderController>(context, listen: false).init(context);
  }

  @override
  Widget build(BuildContext context) {
    //Controller do provider
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
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
            selectedItemColor: Constants.blackColor,
            selectedLabelStyle: GoogleFonts.raleway(
              color: Constants.blackColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: GoogleFonts.raleway(
              color: Constants.textFieldDisable,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedIconTheme: const IconThemeData(color: Constants.textFieldDisable),
            selectedIconTheme: const IconThemeData(color: Constants.primaryColor),
            unselectedItemColor: Constants.textFieldDisable,
            iconSize: 18,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(
                      bottomNavigationController.selectedIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      size: 20,
                      color: bottomNavigationController.selectedIndex == 0
                          ? Constants.blackColor
                          : Constants.textFieldDisable,
                    ),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(
                      bottomNavigationController.selectedIndex == 1
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 20,
                      color: bottomNavigationController.selectedIndex == 1
                          ? Constants.blackColor
                          : Constants.textFieldDisable,
                    ),
                  ),
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(
                      bottomNavigationController.selectedIndex == 2
                          ? Icons.search
                          : Icons.search_outlined,
                      size: 20,
                      color: bottomNavigationController.selectedIndex == 2
                          ? Constants.blackColor
                          : Constants.textFieldDisable,
                    ),
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(
                      bottomNavigationController.selectedIndex == 3
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined,
                      size: 20,
                      color: bottomNavigationController.selectedIndex == 3
                          ? Constants.blackColor
                          : Constants.textFieldDisable,
                    ),
                  ),
                ),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(
                    bottomNavigationController.selectedIndex == 4
                        ? Icons.person
                        : Icons.person_outline,
                    size: 20,
                    color: bottomNavigationController.selectedIndex == 4
                        ? Constants.blackColor
                        : Constants.textFieldDisable,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: bottomNavigationController.pages[bottomNavigationController.selectedIndex],
    );
  }
}
