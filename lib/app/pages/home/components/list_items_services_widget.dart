import 'package:flutter/material.dart';

import '../../../../domain/models/products/product_model.dart';
import 'item_product_widget.dart';

class ListProductsWidget extends StatelessWidget {
  final List<ProductModel> listProduct;

  const ListProductsWidget({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 290,
      ),
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 100),
      shrinkWrap: true,
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        return ProductItemWidget(
          item: listProduct[index],
        );
      },
    );
  }
}
