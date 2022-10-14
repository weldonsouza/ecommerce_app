import 'package:ecommerce_app/app/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bag/bag_page.dart';
import '../favorite/favorite_page.dart';
import '../home/home_page.dart';
import '../login/login_controller.dart';
import '../profile/profile_page.dart';

class BottomNavigationBarController with ChangeNotifier {
  int selectedIndex = 0;
  var loginController;
  late BuildContext context;

  final List<Widget> pages = [
    const HomePage(key: PageStorageKey('home')),
    const FavoritePage(key: PageStorageKey('favorite')),
    const SearchPage(key: PageStorageKey('search')),
    const BagPage(key: PageStorageKey('bag')),
    const ProfilePage(key: PageStorageKey('profile')),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  setContext(BuildContext value) => context = value;

  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void init(context) async {
    loginController = Provider.of<LoginController>(context, listen: false);
    setContext(context);
  }
}
