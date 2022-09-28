import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar_controller_view_model.dart';

class BottomNavigationBarController extends StatefulWidget {
  const BottomNavigationBarController({Key? key}) : super(key: key);

  static String get routeName => '/buttom_navigation';

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
    //Controller do provider
    var bottomNavigationController = Provider.of<BottomNavigationBarProviderController>(context);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [

        ],
      ),
      body: bottomNavigationController.pages[bottomNavigationController.selectedIndex],
    );
  }
}
