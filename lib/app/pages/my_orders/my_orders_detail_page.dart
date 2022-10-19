import 'package:ecommerce_app/app/pages/my_orders/components/delivery_status_timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/models/my_orders/my_order_model.dart';
import '../../widgets/custom_app_bar.dart';
import 'components/custom_card_my_order_widget.dart';
import 'my_orders_controller.dart';

class MyOrdersDetailPage extends StatelessWidget {
  const MyOrdersDetailPage({Key? key}) : super(key: key);

  static String get routeName => '/my_orders_detail';

  @override
  Widget build(BuildContext context) {
    var myOrdersController = Provider.of<MyOrdersController>(context);

    MyOrderModel args = ModalRoute.of(context)!.settings.arguments as MyOrderModel;

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'Order Detail',
        isBackButtonVisible: true,
        onTapButtonBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      Text(
                        '${args.orderNumber}',
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${args.date}',
                    style: GoogleFonts.poppins(
                      color: Constants.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
              CustomCardMyOrderWidget(
                title: 'Tracking number: ',
                subTitle: '${args.trackingNumber}',
                fontSizeTitle: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCardMyOrderWidget(
                    title: 'Quantity: ',
                    subTitle: '${args.quantity}',
                    fontSizeTitle: 14,
                  ),
                  CustomCardMyOrderWidget(
                    title: 'Total amount: ',
                    subTitle: '\$ ${args.totalAmount}',
                    fontSizeTitle: 14,
                  ),
                ],
              ),
              SizedBox(height: 8),
              DeliveryStatusTimelineWidget(
                historic: args.historic,
              ),
              SizedBox(height: 8),
              Text(
                'Order Information',
                style: GoogleFonts.poppins(
                  color: Constants.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomCardMyOrderWidget(
                title: 'Shopping Address: ',
                subTitle: '${args.shoppingAddress}',
                fontSizeTitle: 14,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Payment Method: ',
                    style: GoogleFonts.poppins(
                      color: Constants.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 2,
                    ),
                  ),
                  myOrdersController.iconBand(args.paymentMethod),
                  SizedBox(width: 4),
                  Text(
                    '${args.cardNumber}',
                    style: GoogleFonts.poppins(
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomCardMyOrderWidget(
                title: 'Delivery Method: ',
                subTitle: '${args.deliveryMethod}',
                fontSizeTitle: 14,
                fontSizeSubTitle: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
