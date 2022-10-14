import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../domain/models/products/product_model.dart';

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

  final CarouselController controllerCarouselSlider = CarouselController();
  int current = 0;
  double sizeInit = 0.53;

  @override
  Widget build(BuildContext context) {
    ProductModel args = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Stack(
        children: [
          CarouselSlider(
            carouselController: controllerCarouselSlider,
            items: args.images!.map((item) => Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: item,
                  width: double.infinity,
                  height: 393,
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
                          Constants.primaryColor,
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
                          onTap: () => controllerCarouselSlider.previousPage(),
                          child: Container(
                            width: Utils.mediaQuery(context, 0.47),
                            height: 393,
                            color: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controllerCarouselSlider.nextPage(),
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
              height: 393,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              initialPage: 0,
              disableCenter: false,
              reverse: false,
              autoPlay: false,
              enableInfiniteScroll: args.images!.length == 1 ? false : true,
              onPageChanged: (index, reason) {
                //serviceController.setCurrentImage(index);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Utils.mediaQuery(context, 0.5, direction: 'H')),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: args.images!.asMap().entries.map((index) => Container(
                width: current == index.key ? 10 : 5,
                height: current == index.key ? 10 : 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current == index.key
                      ? Constants.primaryColor
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
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: CustomButton(
                        labelText: '',
                        width: 40,
                        height: 30,
                        borderRadius: 100,
                        elevation: 1.5,
                        iconSize: 16,
                        paddingButton: 0,
                        color: Constants.surface,
                        colorText: Constants.primaryColor2,
                        colorButton: Constants.surface,
                        iconData: Icons.arrow_back_outlined,
                        colorIconButton: Constants.primaryColor2,
                        leftButton: 0,
                        rightButton: 0,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: CustomButton(
                        labelText: '',
                        width: 40,
                        height: 30,
                        borderRadius: 100,
                        elevation: 1.5,
                        iconSize: 16,
                        paddingButton: 0,
                        color: Constants.surface,
                        colorText: Constants.primaryColor2,
                        colorButton: Constants.surface,
                        iconData: Icons.share_outlined,
                        colorIconButton: Constants.primaryColor2,
                        leftButton: 0,
                        rightButton: 0,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: sizeInit,
            minChildSize: sizeInit,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: Constants.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 8),
                            child: Text(
                              '${args.name}',
                              style: GoogleFonts.raleway(
                                color: Constants.blackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                            child: Text(
                              '${args.description}',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.raleway(
                                  color: Constants.textField,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.25
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, left: 15, bottom: 15),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.alarm_outlined,
                                        color: Constants.primaryColor,
                                      ),
                                      const SizedBox(width: 15),
                                      /*Text(
                                        '${serviceController.service.minimumDuration} a '
                                            '${serviceController.service.maximumDuration} minutos',
                                        style: GoogleFonts.raleway(
                                            color: Constants.colorText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.25
                                        ),
                                      ),*/
                                    ],
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
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButton(
                  labelText: serviceController.getPriceService,
                  width: Utils.mediaQuery(context, 1),
                  height: 30,
                  borderRadius: 10,
                  elevation: 3,
                  textSize: 14,
                  iconSize: 24,
                  paddingButton: 8,
                  color: Constants.primaryColor2,
                  colorText: Constants.whiteColor,
                  colorButton: Constants.primaryColor2,
                  iconData: Icons.today,
                  fontWeight: FontWeight.w700,
                  onTap: () async {
                    if (loginController.previousPage == 'address') {
                      CustomAlertLogin.showAlert(
                        context: context,
                        title: 'Faça login',
                        warning: 'Para continuar com o seu pedido, você precisa se autênticar na plataforma.',
                        iconSvg: 'phone_done',
                        iconSvg1: 'google',
                        iconSvg2: 'apple',
                        textButtonTap1: 'Entrar com o Google',
                        textButtonTap2: 'Entrar com Apple',
                        iconSize: 15,
                        onTapLoginGoogle: () async {
                          User? user = await authentication.signInWithGoogle(context: context);

                          if (user != null) {
                            //loginController.authenticationGoogle(context);

                            // TODO -------------- Mock --------------
                            CustomAlertSignUp.showAlert(
                              context: context,
                              title: 'Política de Privacidade e \nTermos de Uso',
                              warning: 'Ao tocar em Concordar, você aceita os ',
                              iconData: Icons.assignment,
                              onTapToAgree: () async {
                                Navigator.of(context).pop();
                                await navigationService.pushReplacement(LoginSignupView.routeName);
                              },
                              onTapExit: () {
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                        onTapLoginApple: () {
                          loginController.setPreviousPage('singup');
                          bottomNavigationController.onItemTapped(1);
                          navigationService.pushReplacement(BottomNavigationBarController.routeName);
                        },
                      );
                    } else {
                      serviceController.selectDatePicker(context, routeName: '/service');
                    }
                  },
                ),
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
