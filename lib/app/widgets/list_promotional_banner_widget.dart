import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/constants.dart';
import '../../domain/models/products/promo_model.dart';

class ListPromotionalBannerWidget extends StatefulWidget {
  final List<PromoModel>? listBanners;

  const ListPromotionalBannerWidget({
    Key? key,
    this.listBanners,
  }) : super(key: key);

  @override
  _ListPromotionalBannerWidgetState createState() => _ListPromotionalBannerWidgetState();
}

class _ListPromotionalBannerWidgetState extends State<ListPromotionalBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.listBanners!.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServicePromoView(listBanners: widget.listBanners![index])),
          );*/
          },
          child: Container(
            width: 287,
            height: 128,
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              elevation: 1.5,
              color: Colors.grey.shade300,
              margin: const EdgeInsets.only(right: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: widget.listBanners![index].image!,
                  width: double.infinity,
                  height: 80,
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
            ),
          ),
        );
      },
    );
  }
}