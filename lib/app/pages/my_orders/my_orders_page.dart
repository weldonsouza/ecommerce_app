import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'my_orders_controller.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  static String get routeName => '/my_orders';

  @override
  Widget build(BuildContext context) {
    var myOrdersController = Provider.of<MyOrdersController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'My Orders',
        isBackButtonVisible: true,
        onTapButtonBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          SizedBox(
            width: Utils.mediaQuery(context, 1),
            height: 40,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: myOrdersController.orderTypes.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              itemBuilder: (context, index) {
                return Container(
                  height: 28,
                  margin: EdgeInsets.only(top: 8, right: 8),
                  child: CustomIconButton(
                    color: myOrdersController.selectTypeOrder == index
                        ? Constants.primaryColor.withOpacity(0.7)
                        : Constants.transparent,
                    borderRadius: 100,
                    onTap: () {
                      myOrdersController.setTypeOrder(index);
                    },
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Text(
                        myOrdersController.orderTypes[index],
                        style: GoogleFonts.poppins(
                          color: myOrdersController.selectTypeOrder == index
                              ? Constants.blackColor
                              : Constants.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: myOrdersController.orderTypes.length,
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              itemBuilder: (context, index) {
                return Container(
                  width: Utils.mediaQuery(context, 1),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order No: ',
                                    style: GoogleFonts.poppins(
                                      color: Constants.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'date,',
                            style: GoogleFonts.poppins(
                              color: Constants.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'comment',
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
