import 'package:flutter/material.dart';

import '../../../domain/models/products/product_model.dart';

class BagController with ChangeNotifier {
  List<ProductModel> listBagProducts = <ProductModel>[];
  double totalValue = 0;
  int quantity = 1;

  setBagProducts(ProductModel value) {
    final index = listBagProducts.indexWhere((element) => element.id! == value.id!);

    if (index == -1) {
      listBagProducts.add(value);
      calculateTotal();
    }

    notifyListeners();
  }

  removeBagProductsId(String id) {
    listBagProducts.removeWhere((item) => item.id == id);
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    double total = 0;

    for(int i = 0; i < listBagProducts.length; i++) {
      total += listBagProducts[i].price!;
    }

    totalValue = double.parse(total.toStringAsFixed(2));
    notifyListeners();
  }

  addQuantity() {
    quantity++;
    notifyListeners();
  }

  removeQuantity() {
    if (quantity != 0) quantity--;
    notifyListeners();
  }
}