import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/products/comments_model.dart';
import '../../../domain/models/products/product_model.dart';
import '../../../domain/models/products/promo_model.dart';

class HomeController with ChangeNotifier {
  List<PromoModel> promotionalBanner = <PromoModel>[];
  List<ProductModel> listProducts = <ProductModel>[];

  bool isLoading = false;
  bool isFavorite = false;

  bool get getIsLoading => isLoading;

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setIsFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  setPromotionalBanner(List<PromoModel> value) {
    promotionalBanner = value;
    notifyListeners();
  }

  setProducts(List<ProductModel> value) {
    listProducts.clear();
    listProducts = value;
    notifyListeners();
  }

  void init() async {
    listProducts.clear();
    findAllProducts();
  }

  void dispose() {
    listProducts.clear();
  }

  Future<String> findAllProducts() async {
    setIsLoading(true);

    List<PromoModel> promotionalResult = [
      PromoModel(
        id: "619d23869c71130f9ea35781",
        name: "On everything today",
        description: "With code: 50Off",
        image: "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
        couponValue: '50% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea35782",
        name: "On everything today",
        description: "With code: 60Off",
        image: "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
        couponValue: '60% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea35783",
        name: "On everything today",
        description: "With code: 65Off",
        image: "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
        couponValue: '65% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea35784",
        name: "On everything today",
        description: "With code: 90Off",
        image: "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
        couponValue: '90% Off',
      ),
    ];
    setPromotionalBanner(promotionalResult);

    List<ProductModel> productsResult = [
      ProductModel(
        id: "619d23869c71130f9ea35701",
        name: "JBL Live 660NC",
        description: "Noise-canceling wireless over-ear headphones",
        price: 173.27,
        favorite: false,
        review: 5.0,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwfb3a7d36/JBL_LIVE_660NC_Product%20image_Front_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw205d05a6/JBL_LIVE_660NC_Product%20image_Cushion_Black.png?sw=537&sfrm=png",
        ],
        color: [
          Constants.blackColor,
          Constants.errorSnackBarColor,
          Constants.successSnackBarColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 3.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 3.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35702",
        name: "JBL Tour One",
        description: "Wireless over-ear headphones",
        price: 327.47,
        favorite: false,
        review: 4.7,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw141b4a70/JBL_TOUR_ONE_Product%20Image_Buttons.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw3df2213a/JBL_TOUR_ONE_Product%20Image_Left%20View.png?sw=537&sfrm=png",
        ],
        color: [
          Constants.blackColor,
          Constants.errorSnackBarColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35703",
        name: "Y50BT",
        description: "On-ear Bluetooth headphones",
        price: 149.95,
        favorite: false,
        review: 4.8,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwc076cfc4/Y50BT-Black-Front-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw77af3431/Y50BT-Black-Hero_dvHAMaster.png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35704",
        name: "AKG N700NC",
        description: "Wireless, Adaptive Noise Cancelling Headphones",
        price: 99.99,
        favorite: false,
        review: 4.9,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw2bc0e2bd/AKG_Product-Image_N700NC-Wireless_Folded-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4d2a2ea3/AKG_Product-Image_N700NC-Wireless_Detail-View-03-1605x1605px.png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35705",
        name: "JBL Live 660NC",
        description: "Noise-canceling wireless over-ear headphones",
        price: 173.27,
        favorite: false,
        review: 5.0,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwfb3a7d36/JBL_LIVE_660NC_Product%20image_Front_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw205d05a6/JBL_LIVE_660NC_Product%20image_Cushion_Black.png?sw=537&sfrm=png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35706",
        name: "JBL Tour One",
        description: "Wireless over-ear headphones",
        price: 327.47,
        favorite: false,
        review: 4.2,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw141b4a70/JBL_TOUR_ONE_Product%20Image_Buttons.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw3df2213a/JBL_TOUR_ONE_Product%20Image_Left%20View.png?sw=537&sfrm=png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35707",
        name: "Y50BT",
        description: "On-ear Bluetooth headphones",
        price: 149.95,
        favorite: false,
        review: 4.5,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwc076cfc4/Y50BT-Black-Front-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw77af3431/Y50BT-Black-Hero_dvHAMaster.png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea35708",
        name: "AKG N700NC Wireless",
        description: "Wireless, Adaptive Noise Cancelling Headphones",
        price: 99.99,
        favorite: false,
        review: 4.7,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw2bc0e2bd/AKG_Product-Image_N700NC-Wireless_Folded-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4d2a2ea3/AKG_Product-Image_N700NC-Wireless_Detail-View-03-1605x1605px.png",
        ],
        color: [
          Constants.blackColor,
        ],
        comments: [
          CommentsModel(
            id: '619d23869c71130f9ea35111',
            name: 'Christopher Vaughn',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book.',
            review: 5.0,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '5h oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35112',
            name: 'Justin Clark',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            review: 4.5,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '1D oct',
          ),
          CommentsModel(
            id: '619d23869c71130f9ea35113',
            name: 'Joseph Foley',
            comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to'
                ' make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, '
                'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing '
                'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions '
                'of Lorem Ipsum.',
            review: 3,
            photo: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            date: '2D oct',
          ),
        ],
      ),
    ];

    setProducts(productsResult);

    setIsLoading(false);
    return 'success';
  }
}
