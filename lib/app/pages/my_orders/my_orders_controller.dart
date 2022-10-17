import 'package:flutter/material.dart';

class MyOrdersController with ChangeNotifier {
  final List<String> orderTypes = ['All', 'Processing', 'Delivered', 'Cancelled'];
  int selectTypeOrder = 0;

  setTypeOrder(int value) {
    selectTypeOrder = value;
    notifyListeners();
  }
}