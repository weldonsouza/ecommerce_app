import 'package:flutter/material.dart';

import '../../../domain/models/products/product_model.dart';

class BagController with ChangeNotifier {
  List<ProductModel> listBagProducts = <ProductModel>[];

  setBagProducts(ProductModel value) {
    listBagProducts.add(value);
    notifyListeners();
  }

  removeBagProductsId(String id) {
    listBagProducts.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}