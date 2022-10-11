import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';
import '../../domain/models/products/product_model.dart';
import 'custom_icon_button.dart';

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
      child: Column(
        children: [
          Stack(
            children: [
              Card(
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
                        height: 230,
                        fit: BoxFit.contain,
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 28,
                  height: 28,
                  margin: EdgeInsets.only(top: 8, right: 8),
                  child: CustomIconButton(
                    borderRadius: 100,
                    color: Constants.transparent,
                    widget: SvgPicture.asset(
                      'assets/icons/favorite_outlined.svg',
                      color: Constants.blackColor,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.name}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.blackColor,
                  ),
                ),
                SizedBox(width: double.infinity),
                Text(
                  '\$ ${formatFraction.format(item.price)}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    color: Constants.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
