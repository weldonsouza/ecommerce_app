import 'package:flutter/material.dart';

import '../../../../domain/models/products/product_model.dart';
import 'product_item_widget.dart';

class ListItemsProductWidget extends StatelessWidget {
  final List<ProductModel> listProduct;

  const ListItemsProductWidget({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
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
