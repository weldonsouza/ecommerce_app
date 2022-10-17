import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class ProductDetailController with ChangeNotifier {
  final CarouselController controllerCarouselSlider = CarouselController();
  int current = 0;
  bool favorite = false;
  int selectColor = 0;

  setCurrentImage(int value) {
    current = value;
    notifyListeners();
  }

  setColor(int value) {
    selectColor = value;
    notifyListeners();
  }

  setFavorite(bool value) {
    favorite = value;
    notifyListeners();
  }
}