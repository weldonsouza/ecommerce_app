import 'package:ecommerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'components/list_my_order_widget.dart';
import 'my_orders_controller.dart';

class MyOrderDetailsWidget extends StatefulWidget {
  const MyOrderDetailsWidget({Key? key}) : super(key: key);

  static String get routeName => '/my_orders';

  @override
  State<MyOrderDetailsWidget> createState() => _MyOrderDetailsWidgetState();
}

class _MyOrderDetailsWidgetState extends State<MyOrderDetailsWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyOrdersController>(context, listen: false).init();
    });
  }

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
                        ? Constants.primaryColor.withOpacity(0.4)
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
            child: myOrdersController.isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Constants.primaryColor,
                        ),
                      ),
                    ),
                  )
                : (myOrdersController.listMyOrders.isNotEmpty
                    ? ListMyOrderWidget(
                        listMyOrders: myOrdersController.listMyOrders,
                      )
                    : Container()),
          ),
        ],
      ),
    );
  }
}
