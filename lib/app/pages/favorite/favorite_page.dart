import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/route/navigation_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_empty_widget.dart';
import '../../widgets/custom_icon_button.dart';
import '../bag/bag_controller.dart';
import '../main/bottom_navigation_bar_controller_page.dart';
import '../main/bottom_navigation_bar_controller.dart';
import 'favorite_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static String get routeName => '/favorite';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationController = Provider.of<BottomNavigationBarController>(context);
    var favoriteController = Provider.of<FavoriteController>(context);
    var bagController = Provider.of<BagController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'Wishlist',
        isBackButtonVisible: true,
        widget: Container(
          width: 40,
          height: 40,
          child: CustomIconButton(
            widget: favoriteController.listFavoriteProducts.isEmpty
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
                      '${favoriteController.listFavoriteProducts.length}',
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
            color: Constants.primaryColor.withOpacity(0.3),
            onTap: () {
              bottomNavigationController.onItemTapped(3);
              navigationService.pushReplacement(BottomNavigationBarControllerPage.routeName);
            },
          ),
        ),
      ),
      body: favoriteController.listFavoriteProducts.isEmpty
          ? CustomEmptyWidget(
              icon: 'note_list',
              title: 'My Wishlist is Empty!',
              subTitle: 'Tab heart button to start saving your favorite items.',
              titleButton: 'Explore',
              widthButton: Utils.mediaQuery(context, 0.3),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteController.listFavoriteProducts.length,
              padding: const EdgeInsets.only(top: 16, left: 20, bottom: 90),
              itemBuilder: (context, index) {
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        print('DismissiblePane ${favoriteController.listFavoriteProducts[index].id!}');
                        favoriteController.removeFavoriteProductsId(favoriteController.listFavoriteProducts[index].id!);
                      },
                    ),
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        autoClose: true,
                        flex: 1,
                        onPressed: (value) {
                          print('SlidableAction ${favoriteController.listFavoriteProducts[index].id!}');

                          favoriteController.removeFavoriteProductsId(favoriteController.listFavoriteProducts[index].id!);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: Utils.mediaQuery(context, 1),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          height: 140,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Card(
                            elevation: 1.5,
                            color: Colors.grey.shade300,
                            margin: const EdgeInsets.only(right: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: SizedBox(
                              width: 180,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                child: CachedNetworkImage(
                                  imageUrl: favoriteController.listFavoriteProducts[index].images![0],
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
                        ),
                        Container(
                          height: 140,
                          padding: const EdgeInsets.only(top: 4, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoriteController.listFavoriteProducts[index].name!,
                                    style: GoogleFonts.poppins(
                                      color: Constants.blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Review (',
                                        style: GoogleFonts.poppins(
                                          color: Constants.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(IconData(0xe5f9, fontFamily: 'MaterialIcons'), size: 16),
                                      Text(
                                        ' ${favoriteController.listFavoriteProducts[index].review} )',
                                        style: GoogleFonts.poppins(
                                          color: Constants.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '\$ ${favoriteController.listFavoriteProducts[index].price!}',
                                style: GoogleFonts.poppins(
                                  color: Constants.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 32,
                                child: CustomElevatedButton(
                                  labelText: 'Add to Bag',
                                  textSize: 14,
                                  paddingButton: 0,
                                  paddingButtonLeft: 0,
                                  paddingButtonRight: 0,
                                  onTap: () {
                                    bagController.setBagProducts(favoriteController.listFavoriteProducts[index]);
                                  },
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
