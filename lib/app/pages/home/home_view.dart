import 'package:ecommerce_app/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/list_items_services_widget.dart';
import '../../widgets/list_promotional_banner_widget.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static String get routeName => '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProviderController>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeProviderController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      /*appBar: AppBar(
        backgroundColor: Constants.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Container(
            width: 28,
            height: 28,
            margin: EdgeInsets.only(right: 16),
            child: CustomIconButton(
              widget: Icon(Icons.notifications, size: 20),
              color: Constants.primaryColor.withOpacity(0.3),
            ),
          ),
        ],
      ),*/
      body: Column(
        children: [
          /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 40, right: 16, bottom: 24),
                child: CustomIconButton(
                  widget: Icon(Icons.notifications, size: 20),
                  color: Constants.primaryColor.withOpacity(0.3),
                ),
              ),
            ],
          ),*/
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 4, bottom: 8),
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
                          height: 128,
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
                          ? ListProductsWidget(
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
