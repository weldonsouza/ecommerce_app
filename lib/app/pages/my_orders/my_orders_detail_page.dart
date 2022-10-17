import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/custom_app_bar.dart';

class MyOrdersDetailPage extends StatelessWidget {
  const MyOrdersDetailPage({Key? key}) : super(key: key);

  static String get routeName => '/my_orders_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'My Bag',
        isBackButtonVisible: true,
        onTapButtonBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
