import 'package:ecommerce_app/app/pages/my_orders/components/custom_card_my_order_widget.dart';
import 'package:ecommerce_app/app/pages/my_orders/my_orders_detail_page.dart';
import 'package:ecommerce_app/core/route/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/models/my_orders/my_order_model.dart';
import '../../../widgets/custom_elevated_button.dart';

class ListMyOrderWidget extends StatelessWidget {
  final List<MyOrderModel> listMyOrders;

  const ListMyOrderWidget({
    Key? key,
    required this.listMyOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listMyOrders.length,
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      itemBuilder: (context, index) {
        return Container(
          width: Utils.mediaQuery(context, 1),
          decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(8),
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${listMyOrders[index].orderNumber}',
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${listMyOrders[index].date}',
                    style: GoogleFonts.poppins(
                      color: Constants.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              CustomCardMyOrderWidget(
                title: 'Tracking number: ',
                subTitle: '${listMyOrders[index].trackingNumber}',
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCardMyOrderWidget(
                    title: 'Quantity: ',
                    subTitle: '${listMyOrders[index].quantity}',
                  ),
                  CustomCardMyOrderWidget(
                    title: 'Total amount: ',
                    subTitle: '\$ ${listMyOrders[index].totalAmount}',
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    labelText: 'Details',
                    width: 100,
                    height: 16,
                    textSize: 14,
                    paddingButtonLeft: 0,
                    paddingButtonRight: 0,
                    paddingButton: 0,
                    onTap: () {
                      navigationService.push(
                        MyOrdersDetailPage.routeName,
                        arguments: listMyOrders[index],
                      );
                    },
                  ),
                  Text(
                    '${listMyOrders[index].status}',
                    style: GoogleFonts.poppins(
                      color: Constants.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
