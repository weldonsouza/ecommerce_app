import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants.dart';
import '../../../../domain/models/products/promo_model.dart';

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
              child: Stack(
                children: [
                  Positioned(
                    top: -30,
                    right: -40,
                    bottom: -30,
                    child: SizedBox(
                      width: 180,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl: widget.listBanners![index].image!,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.listBanners![index].couponValue!,
                          style: GoogleFonts.poppins(
                            color: Constants.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2
                          ),
                        ),
                        Text(
                          widget.listBanners![index].name!,
                          style: GoogleFonts.poppins(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          widget.listBanners![index].description!,
                          style: GoogleFonts.poppins(
                            color: Constants.textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 60,
                          height: 22,
                          child: CustomElevatedButton(
                            labelText: 'Get Now',
                            textSize: 9,
                            paddingButton: 0,
                            paddingButtonLeft: 0,
                            paddingButtonRight: 0,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}