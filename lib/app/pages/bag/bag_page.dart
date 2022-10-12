import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app/widgets/custom_empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'bag_controller.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  static String get routeName => '/bag';

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  void initState() {
    super.initState();
  }

  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }
  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bagController = Provider.of<BagController>(context);

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        context,
        title: 'My Bag',
        isBackButtonVisible: true,
        widget: Text(
          bagController.listBagProducts.isEmpty
              ? ''
              : '${bagController.listBagProducts.length} Items',
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: bagController.listBagProducts.isEmpty
          ? CustomEmptyWidget(
              icon: 'empty_bag',
              title: 'My Bag is Empty!',
              subTitle: 'Explore more and shortlist some items.',
              titleButton: 'Start Shopping',
              widthButton: Utils.mediaQuery(context, 0.4),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bagController.listBagProducts.length,
              padding: const EdgeInsets.only(top: 16, left: 20, bottom: 90),
              itemBuilder: (context, index) {
                return Slidable(
                  key: const ValueKey(1),
                  endActionPane: ActionPane(
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        bagController.removeBagProductsId(bagController.listBagProducts[index].id!);
                      },
                    ),
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        autoClose: true,
                        flex: 1,
                        onPressed: (value) {
                          bagController.removeBagProductsId(bagController.listBagProducts[index].id!);
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
                                  imageUrl: bagController.listBagProducts[index].images![0],
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
                                    bagController.listBagProducts[index].name!,
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
                                        ' ${bagController.listBagProducts[index].review} )',
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
                                '\$ ${bagController.listBagProducts[index].price!}',
                                style: GoogleFonts.poppins(
                                  color: Constants.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 70,
                                      color: Constants.primaryColor.withOpacity(0.5),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        '$_n',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: CustomIconButton(
                                            widget: Icon(
                                              Icons.remove,
                                              color: Constants.whiteColor,
                                              size: 16,
                                            ),
                                            color: Constants.textFieldDisable,
                                            paddingButton: 0,
                                            onTap: minus,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: CustomIconButton(
                                            widget: Icon(
                                              Icons.add,
                                              color: Constants.whiteColor,
                                              size: 16,
                                            ),
                                            color: Constants.blackColor,
                                            paddingButton: 0,
                                            onTap: add,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
