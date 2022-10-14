import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../domain/models/products/product_model.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../bag/bag_controller.dart';
import '../favorite/favorite_controller.dart';
import '../main/bottom_navigation_bar_controller.dart';
import '../main/bottom_navigation_bar_controller_page.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  static String get routeName => '/product';

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
  }
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    var productDetailController = Provider.of<ProductDetailController>(context);
    var bagController = Provider.of<BagController>(context);
    var bottomNavigationController = Provider.of<BottomNavigationBarController>(context);
    var favoriteController = Provider.of<FavoriteController>(context);

    ProductModel args = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: [
          Container(
            color: Constants.primaryColor,
            padding: EdgeInsets.only(bottom: Utils.mediaQuery(context, 0.3, direction: 'H')),
            child: CarouselSlider(
              carouselController: productDetailController.controllerCarouselSlider,
              items: args.images!.map((item) => Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.fitHeight,
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
                            Constants.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => productDetailController.controllerCarouselSlider.previousPage(),
                            child: Container(
                              width: Utils.mediaQuery(context, 0.47),
                              height: 393,
                              color: Colors.transparent,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => productDetailController.controllerCarouselSlider.nextPage(),
                            child: Container(
                              width: Utils.mediaQuery(context, 0.47),
                              height: 393,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 300,
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                initialPage: 0,
                disableCenter: false,
                reverse: false,
                autoPlay: false,
                enableInfiniteScroll: args.images!.length == 1 ? false : true,
                onPageChanged: (index, reason) {
                  productDetailController.setCurrentImage(index);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Utils.mediaQuery(context, 0.41, direction: 'H')),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: args.images!.asMap().entries.map((index) => Container(
                width: productDetailController.current == index.key ? 8 : 6,
                height: productDetailController.current == index.key ? 8 : 6,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: productDetailController.current == index.key
                      ? Constants.blackColor
                      : Colors.white,
                ),
              ),
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: CustomIconButton(
                        widget: Icon(
                          Icons.arrow_back_outlined,
                          color: Constants.blackColor,
                        ),
                        color: Constants.whiteColor.withOpacity(0.7),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: CustomIconButton(
                        widget: bagController.listBagProducts.isEmpty
                            ? SvgPicture.asset(
                                'assets/icons/shopping_bag.svg',
                                width: 20,
                                height: 20,
                                color: Constants.blackColor,
                              )
                            : Badge(
                                badgeColor: Constants.errorSnackBarColor,
                                elevation: 0,
                                position: BadgePosition.topEnd(top: -8, end: -8),
                                badgeContent: Text(
                                  '${bagController.listBagProducts.length}',
                                  style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/shopping_bag.svg',
                                  width: 20,
                                  height: 20,
                                  color: Constants.blackColor,
                                ),
                              ),
                        color: Constants.whiteColor.withOpacity(0.7),
                        onTap: () {
                          bottomNavigationController.onItemTapped(3);
                          navigationService.pushReplacement(BottomNavigationBarControllerPage.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.53,
            maxChildSize: 1,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Container(
                  height: 450,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Constants.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconData(0xe5f9, fontFamily: 'MaterialIcons'), size: 20),
                            Text(
                              ' ${args.review}',
                              style: GoogleFonts.poppins(
                                color: Constants.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              '${args.name}',
                              style: GoogleFonts.poppins(
                                color: Constants.blackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              '\$ ${args.price!}',
                              style: GoogleFonts.poppins(
                                color: Constants.blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${args.description}',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          color: Constants.textField,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.25,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Constants.textFieldDisable,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Low in stock',
                            style: GoogleFonts.poppins(
                              color: Constants.textFieldDisable,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 16),
                          Icon(
                            Icons.undo_outlined,
                            color: Constants.textFieldDisable,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '30 Day Returns',
                            style: GoogleFonts.poppins(
                              color: Constants.textFieldDisable,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Color',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
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
                          favoriteController.setFavoriteProducts(args);
                        } else {
                          favoriteController.removeFavoriteProductsId(args.id!);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CustomElevatedButton(
                      labelText: 'Add to Bag',
                      width: Utils.mediaQuery(context, 0.75),
                      paddingButtonLeft: 0,
                      paddingButtonRight: 0,
                      onTap: () {
                        bagController.setBagProducts(args);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}