import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/route/navigation_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/models/products/product_model.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../favorite/favorite_controller.dart';
import '../../product/product_detail_page.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel item;

  const ProductItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool favorite = false;

  @override
  void initState() {
    super.initState();

    if (widget.item.favorite == true) {
      favorite = true;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<FavoriteController>(context, listen: false).setFavoriteProducts(widget.item);
      });
    } else {
      favorite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var favoriteController = Provider.of<FavoriteController>(context);

    return GestureDetector(
      onTap: () {
        navigationService.push(
          ProductDetailPage.routeName,
          arguments: widget.item,
        );
      },
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
                        imageUrl: widget.item.images![0],
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
                      favorite == true ? 'assets/icons/favorite.svg' : 'assets/icons/favorite_outlined.svg',
                      color: Constants.blackColor,
                    ),
                    onTap: () {
                      setState(() {
                        favorite = !favorite;
                      });

                      if (favorite == true) {
                        favoriteController.setFavoriteProducts(widget.item);
                      } else {
                        favoriteController.removeFavoriteProductsId(widget.item.id!);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.item.name}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.blackColor,
                    height: 0.9,
                  ),
                ),
                SizedBox(width: double.infinity),
                Text(
                  '\$ ${formatFraction.format(widget.item.price)}',
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
