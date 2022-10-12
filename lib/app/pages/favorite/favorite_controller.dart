import 'package:flutter/material.dart';

import '../../../domain/models/products/product_model.dart';

class FavoriteController with ChangeNotifier {
  List<ProductModel> listFavoriteProducts = <ProductModel>[];

  setFavoriteProducts(ProductModel value) {
    listFavoriteProducts.add(value);
    notifyListeners();
  }

  removeFavoriteProductsId(String id) {
    listFavoriteProducts.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}