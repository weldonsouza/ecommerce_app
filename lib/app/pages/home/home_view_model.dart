import 'package:flutter/material.dart';

import '../../../domain/models/products/product_model.dart';
import '../../../domain/models/products/promo_model.dart';

class HomeProviderController with ChangeNotifier {
  List<PromoModel> promotionalBanner = <PromoModel>[];
  List<ProductModel> listProducts = <ProductModel>[];

  bool isLoading = false;

  bool get getIsLoading => isLoading;

  setIsLoading(bool value) {
    isLoading = value;
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
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "With code: 50Off",
        image: "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
        couponValue: '50% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "With code: 60Off",
        image: "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
        couponValue: '60% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "With code: 65Off",
        image: "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
        couponValue: '65% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "With code: 90Off",
        image: "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
        couponValue: '90% Off',
      ),
    ];
    setPromotionalBanner(promotionalResult);

    List<ProductModel> productsResult = [
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "JBL Live 660NC",
        description: "Noise-canceling wireless over-ear headphones",
        price: 173.27,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwfb3a7d36/JBL_LIVE_660NC_Product%20image_Front_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw205d05a6/JBL_LIVE_660NC_Product%20image_Cushion_Black.png?sw=537&sfrm=png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "JBL Tour One",
        description: "Wireless over-ear headphones",
        price: 327.47,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw141b4a70/JBL_TOUR_ONE_Product%20Image_Buttons.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw3df2213a/JBL_TOUR_ONE_Product%20Image_Left%20View.png?sw=537&sfrm=png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Y50BT",
        description: "On-ear Bluetooth headphones",
        price: 149.95,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwc076cfc4/Y50BT-Black-Front-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw77af3431/Y50BT-Black-Hero_dvHAMaster.png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "AKG N700NC",
        description: "Wireless, Adaptive Noise Cancelling Headphones",
        price: 99.99,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw2bc0e2bd/AKG_Product-Image_N700NC-Wireless_Folded-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4d2a2ea3/AKG_Product-Image_N700NC-Wireless_Detail-View-03-1605x1605px.png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "JBL Live 660NC",
        description: "Noise-canceling wireless over-ear headphones",
        price: 173.27,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw17c2971f/JBL_LIVE_660NC_Product%20image_Hero_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwfb3a7d36/JBL_LIVE_660NC_Product%20image_Front_Black.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw205d05a6/JBL_LIVE_660NC_Product%20image_Cushion_Black.png?sw=537&sfrm=png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "JBL Tour One",
        description: "Wireless over-ear headphones",
        price: 327.47,
        images: [
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwe7465125/1.%20JBL_TOUR_ONE_Product%20Image_Hero.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw141b4a70/JBL_TOUR_ONE_Product%20Image_Buttons.png?sw=537&sfrm=png",
          "https://www.jbl.com.br/dw/image/v2/AAUJ_PRD/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw3df2213a/JBL_TOUR_ONE_Product%20Image_Left%20View.png?sw=537&sfrm=png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Y50BT",
        description: "On-ear Bluetooth headphones",
        price: 149.95,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4e4b0060/Y50BT-Black-3D-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwc076cfc4/Y50BT-Black-Front-View-01_dvHAMaster.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw77af3431/Y50BT-Black-Hero_dvHAMaster.png",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "AKG N700NC Wireless",
        description: "Wireless, Adaptive Noise Cancelling Headphones",
        price: 99.99,
        images: [
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dwb3249837/AKG-N700NC-Wireless_Product-Image_Hero-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw2bc0e2bd/AKG_Product-Image_N700NC-Wireless_Folded-1605x1605px.png",
          "https://www.akg.com/on/demandware.static/-/Sites-masterCatalog_Harman/default/dw4d2a2ea3/AKG_Product-Image_N700NC-Wireless_Detail-View-03-1605x1605px.png",
        ],
      ),
    ];

    setProducts(productsResult);

    setIsLoading(false);
    return 'success';
  }
}
