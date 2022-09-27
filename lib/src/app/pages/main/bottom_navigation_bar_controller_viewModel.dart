import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_view.dart';
import '../login/login_viewModel.dart';
import '../profile/profile_view.dart';
import 'bottom_navigation_bar_controller.dart';

class BottomNavigationBarProviderController with ChangeNotifier {
  int selectedIndex = 1;
  var loginController;
  late BuildContext context;

  final List<Widget> pages = [
    const ProfileView(),
    const HomeView(),
  ];

  setContext(BuildContext value) => context = value;

  onItemTapped(int index) {
    if (loginController.previousPage == 'address' && index == 0) {
    } else if (loginController.previousPage == 'address' && index == 1) {
    } else if (loginController.previousPage == 'address') {

    } else {
      selectedIndex = index;
    }

    notifyListeners();
  }

  void init(context) async {
    loginController = Provider.of<LoginProviderController>(context, listen: false);
    setContext(context);
  }
}
