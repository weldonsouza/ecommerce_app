import 'package:badges/badges.dart';
import 'package:ecommerce_app/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_text_form_field.dart';
import 'components/list_items_product_widget.dart';
import 'components/list_promotional_banner_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        backgroundColor: Constants.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi ',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Constants.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rafael',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Constants.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              child: CustomIconButton(
                widget:Badge(
                  badgeColor: Constants.errorSnackBarColor,
                  elevation: 0,
                  position: BadgePosition.topEnd(top: -2, end: -1),
                  child: Icon(Icons.notifications, size: 20),
                ),
                color: Constants.primaryColor.withOpacity(0.3),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 4, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Utils.mediaQuery(context, 0.8),
                  height: 50,
                  child: CustomTextFormField(
                    controller: _searchController,
                    labelText: 'Search',
                    hint: 'Search',
                    keyboardType: TextInputType.text,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/icons/search_outlined.svg',
                        color: Constants.blackColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 16),
                  child: CustomIconButton(
                    widget: SvgPicture.asset(
                      'assets/icons/tune_variant.svg',
                      color: Constants.whiteColor,
                    ),
                    color: Constants.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeController.promotionalBanner.isNotEmpty
                      ? Container(
                          height: 140,
                          margin: const EdgeInsets.only(top: 16),
                          child: ListPromotionalBannerWidget(
                            listBanners: homeController.promotionalBanner,
                          ),
                        )
                      : Container(),
                  homeController.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Constants.primaryColor,
                              ),
                            ),
                          ),
                        )
                      : (homeController.listProducts.isNotEmpty
                          ? ListItemsProductWidget(
                              listProduct: homeController.listProducts,
                            )
                          : Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
