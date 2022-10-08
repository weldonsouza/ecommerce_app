import 'package:ecommerce_app/app/widgets/custom_empty_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_app_bar.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  static String get routeName => '/bag';

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(context, title: 'My Bag', isBackButtonVisible: true),
      body: CustomEmptyWidget(
        icon: 'empty_bag',
        title: 'My Bag is Empty!',
        subTitle: 'Explore more and shortlist some items.',
        titleButton: 'Start Shopping',
        widthButton: Utils.mediaQuery(context, 0.4),
      ),
    );
  }
}
