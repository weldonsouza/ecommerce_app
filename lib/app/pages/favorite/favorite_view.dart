import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_empty_widget.dart';
import '../../widgets/custom_icon_button.dart';
import '../main/bottom_navigation_bar_controller.dart';
import '../main/bottom_navigation_bar_controller_view_model.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  static String get routeName => '/favorite';

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'Wishlist',
        isBackButtonVisible: true,
        widget: Container(
          width: 40,
          height: 40,
          child: CustomIconButton(
            widget: Icon(
              Icons.shopping_bag,
              size: 20,
              color: Constants.blackColor,
            ),
            color: Constants.primaryColor.withOpacity(0.3),
            onTap: () {
              bottomNavigationController.onItemTapped(3);
              navigationService.pushReplacement(BottomNavigationBarController.routeName);
            },
          ),
        ),
      ),
      body: CustomEmptyWidget(
        icon: 'note_list',
        title: 'My Wishlist is Empty!',
        subTitle: 'Tab heart button to start saving your favorite items.',
        titleButton: 'Explore',
        widthButton: Utils.mediaQuery(context, 0.3),
      ),
    );
  }
}
