import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/models/my_orders/my_order_model.dart';

class MyOrdersController with ChangeNotifier {
  final List<String> orderTypes = ['All', 'Processing', 'Delivered', 'Cancelled'];
  List<MyOrderModel> listMyOrders = <MyOrderModel>[];

  int selectTypeOrder = 0;
  bool isLoading = false;
  bool isFavorite = false;

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setTypeOrder(int value) {
    selectTypeOrder = value;
    notifyListeners();
  }

  setListMyOrder(List<MyOrderModel> value) {
    listMyOrders = value;
    notifyListeners();
  }


  calculateSize(size) {
    double height = 0;

    for (int i = 0; i < size; i++) {
      height += 70;
    }

    return height;
  }

  iconStatus(status) {
    IconData icon = Icons.access_time;

    if (status.contains('placed')) {
      icon = Icons.access_time;
    } else if (status.contains('accepted')) {
      icon = Icons.done;
    } else if (status.contains('Processing')) {
      icon = Icons.sync_outlined;
    } else if (status.contains('Shipped')) {
      icon = Icons.local_shipping_outlined;
    } else if (status.contains('Delivered')) {
      icon = Icons.location_on_outlined;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  iconBand(method) {
    String icon = '';

    switch (method) {
      case BrandEnum.Visa:
        icon = 'visa';
        break;
      case BrandEnum.Mastercard:
        icon = 'mastercard';
        break;
      case BrandEnum.Amex:
        icon = 'amex';
        break;
      case BrandEnum.Elo:
        icon = 'elo';
        break;
      case BrandEnum.Discover:
        icon = 'discover';
        break;
      case BrandEnum.Diners:
        icon = 'diners';
        break;
    }

    return SizedBox(
      width: 30,
      height: 30,
      child: SvgPicture.asset(
        'assets/icons/$icon.svg',
      ),
    );
  }

  void init() async {
    listMyOrders.clear();
    findMyOrder();
  }

  Future<String> findMyOrder() async {
    setIsLoading(true);

    List<MyOrderModel> myOrderResult = [
      MyOrderModel(
        id: "619d23869c71130f9ea35781",
        orderNumber: '1248',
        trackingNumber: 'SD38D88F00200S',
        quantity: '1',
        totalAmount: '399',
        status: 'Processing',
        date: '01-10-2022',
        historic: ['Order placed on 01 october', 'Order accepted on 01 october', 'Processing', 'Shipped', 'Delivered'],
        shoppingAddress: 'Matthew Sanchez',
        paymentMethod: BrandEnum.Visa,
        cardNumber: '**** **** **** 5847',
        deliveryMethod: 'Zippy Delivery',
      ),
      MyOrderModel(
        id: "619d23869c71130f9ea35744",
        orderNumber: '1248',
        trackingNumber: 'SD38D88F00200S',
        quantity: '1',
        totalAmount: '100',
        status: 'Delivered',
        date: '09-10-2022',
        historic: ['Order placed on 09 october', 'Order accepted on 09 october', 'Processing'],
        shoppingAddress: 'Matthew Sanchez',
        paymentMethod: BrandEnum.Mastercard,
        cardNumber: '**** **** **** 5847',
        deliveryMethod: 'Zippy Delivery',
      ),
      MyOrderModel(
        id: "619d23869c71130f9ea35733",
        orderNumber: '1248',
        trackingNumber: 'SD38D88F00200S',
        quantity: '1',
        totalAmount: '99',
        status: 'Cancelled',
        date: '10-10-2022',
        historic: ['Order placed on 10 october', 'Order accepted on 10 october', 'Processing', 'Shipped', 'Delivered'],
        shoppingAddress: 'Matthew Sanchez',
        paymentMethod: BrandEnum.Amex,
        cardNumber: '**** **** **** 5847',
        deliveryMethod: 'Zippy Delivery',
      ),
      MyOrderModel(
        id: "619d23869c71130f9ea35755",
        orderNumber: '1248',
        trackingNumber: 'SD38D88F00200S',
        quantity: '1',
        totalAmount: '99',
        status: 'Cancelled',
        date: '10-10-2022',
        historic: ['Order placed on 10 october'],
        shoppingAddress: 'Matthew Sanchez',
        paymentMethod: BrandEnum.Discover,
        cardNumber: '**** **** **** 5847',
        deliveryMethod: 'Zippy Delivery',
      ),
    ];

    setListMyOrder(myOrderResult);

    setIsLoading(false);
    return 'success';
  }
}