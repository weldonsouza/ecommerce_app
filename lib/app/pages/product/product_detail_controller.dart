import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class ProductDetailController with ChangeNotifier {
  final CarouselController controllerCarouselSlider = CarouselController();
  int current = 0;

  setCurrentImage(int value) {
    current = value;
    notifyListeners();
  }
}