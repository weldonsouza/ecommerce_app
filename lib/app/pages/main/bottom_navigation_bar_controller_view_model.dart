import 'package:ecommerce_app/app/pages/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bag/bag_view.dart';
import '../favorite/favorite_view.dart';
import '../home/home_view.dart';
import '../login/login_view_model.dart';
import '../profile/profile_view.dart';

class BottomNavigationBarProviderController with ChangeNotifier {
  int selectedIndex = 0;
  var loginController;
  late BuildContext context;

  final List<Widget> pages = [
    const HomeView(),
    const FavoriteView(),
    const SearchView(),
    const BagView(),
    const ProfileView(),
  ];

  setContext(BuildContext value) => context = value;

  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void init(context) async {
    loginController = Provider.of<LoginProviderController>(context, listen: false);
    setContext(context);
  }
}
