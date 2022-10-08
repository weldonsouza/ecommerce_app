import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';
import '../../domain/models/products/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel item;

  const ProductItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1.5,
        color: Colors.grey.shade300,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: item.images![0],
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: SvgPicture.asset(
                    'assets/icons/image_not_found.svg',
                    width: double.infinity,
                    color: Constants.whiteColor,
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${item.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'R\$${formatFraction.format(item.price)}',
                          style: GoogleFonts.raleway(
                            color: Constants.blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
