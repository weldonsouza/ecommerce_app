import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bag_controller.dart';

class BagDetailPage extends StatefulWidget {
  const BagDetailPage({Key? key}) : super(key: key);

  static String get routeName => '/bag_detail';

  @override
  State<BagDetailPage> createState() => _BagDetailPageState();
}

class _BagDetailPageState extends State<BagDetailPage> {
  @override
  Widget build(BuildContext context) {
    var bagController = Provider.of<BagController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'My Bag',
        isBackButtonVisible: true,
        widget: Text(
          bagController.listBagProducts.isEmpty
              ? ''
              : '${bagController.listBagProducts.length} Items',
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTapButtonBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Constants.whiteColor,
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: GoogleFonts.poppins(
                            color: Constants.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$ ${bagController.listBagProducts[0].price!}',
                          style: GoogleFonts.poppins(
                            color: Constants.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    labelText: 'Proceed',
                    width: Utils.mediaQuery(context, 0.5),
                    paddingButtonLeft: 0,
                    paddingButtonRight: 0,
                    onTap: () {
                      //bagController.setBagProducts(args);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
