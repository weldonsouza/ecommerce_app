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
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a iaculis nunc. Cras sit amet sollicitudin lacus, vel ornare arcu. Donec dapibus orci et sapien ultrices, non viverra mauris accumsan. Donec elementum orci id scelerisque tristique. Ut ultricies ex non ipsum aliquet, eget pulvinar tellus aliquet.",
        image: "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1649030400&Signature=TtitQpSyBXLvpL-TdybML407i0taaeG3Z7yS-HlHhwcnaj0LRWk~dAh1kfXW2xrmMrGx-aRd~ZCs8RO3877Y1uw9hpR9xk2mmycAqUt48AFlks60iyzhGlNkORnTyDESH~Lm9uYat1B15iE3H1FRYhW~igbyWwf7kbCvxdhlTCD8Sq6w2AXa8P7tlWPQPiFuiThqQ5DDYqSrReaU7MrG-x2VMsD4FZDdKCnCtmsDEuOTTkFlBrehzle9qNoGmU~tBwhf~TE0RpFqE7mvx54A9ICeh9KoqrZDnGeNrGU0Jp0AEOmQBAca-sEecY8NbWAxu8NsR6oVaB5Y~Mk72-K4xw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        couponValue: '50% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a iaculis nunc. Cras sit amet sollicitudin lacus, vel ornare arcu. Donec dapibus orci et sapien ultrices, non viverra mauris accumsan. Donec elementum orci id scelerisque tristique. Ut ultricies ex non ipsum aliquet, eget pulvinar tellus aliquet.",
        image: "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1649030400&Signature=TtitQpSyBXLvpL-TdybML407i0taaeG3Z7yS-HlHhwcnaj0LRWk~dAh1kfXW2xrmMrGx-aRd~ZCs8RO3877Y1uw9hpR9xk2mmycAqUt48AFlks60iyzhGlNkORnTyDESH~Lm9uYat1B15iE3H1FRYhW~igbyWwf7kbCvxdhlTCD8Sq6w2AXa8P7tlWPQPiFuiThqQ5DDYqSrReaU7MrG-x2VMsD4FZDdKCnCtmsDEuOTTkFlBrehzle9qNoGmU~tBwhf~TE0RpFqE7mvx54A9ICeh9KoqrZDnGeNrGU0Jp0AEOmQBAca-sEecY8NbWAxu8NsR6oVaB5Y~Mk72-K4xw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        couponValue: '60% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a iaculis nunc. Cras sit amet sollicitudin lacus, vel ornare arcu. Donec dapibus orci et sapien ultrices, non viverra mauris accumsan. Donec elementum orci id scelerisque tristique. Ut ultricies ex non ipsum aliquet, eget pulvinar tellus aliquet.",
        image: "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1649030400&Signature=TtitQpSyBXLvpL-TdybML407i0taaeG3Z7yS-HlHhwcnaj0LRWk~dAh1kfXW2xrmMrGx-aRd~ZCs8RO3877Y1uw9hpR9xk2mmycAqUt48AFlks60iyzhGlNkORnTyDESH~Lm9uYat1B15iE3H1FRYhW~igbyWwf7kbCvxdhlTCD8Sq6w2AXa8P7tlWPQPiFuiThqQ5DDYqSrReaU7MrG-x2VMsD4FZDdKCnCtmsDEuOTTkFlBrehzle9qNoGmU~tBwhf~TE0RpFqE7mvx54A9ICeh9KoqrZDnGeNrGU0Jp0AEOmQBAca-sEecY8NbWAxu8NsR6oVaB5Y~Mk72-K4xw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        couponValue: '65% Off',
      ),
      PromoModel(
        id: "619d23869c71130f9ea3578d",
        name: "On everything today",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a iaculis nunc. Cras sit amet sollicitudin lacus, vel ornare arcu. Donec dapibus orci et sapien ultrices, non viverra mauris accumsan. Donec elementum orci id scelerisque tristique. Ut ultricies ex non ipsum aliquet, eget pulvinar tellus aliquet.",
        image: "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1649030400&Signature=TtitQpSyBXLvpL-TdybML407i0taaeG3Z7yS-HlHhwcnaj0LRWk~dAh1kfXW2xrmMrGx-aRd~ZCs8RO3877Y1uw9hpR9xk2mmycAqUt48AFlks60iyzhGlNkORnTyDESH~Lm9uYat1B15iE3H1FRYhW~igbyWwf7kbCvxdhlTCD8Sq6w2AXa8P7tlWPQPiFuiThqQ5DDYqSrReaU7MrG-x2VMsD4FZDdKCnCtmsDEuOTTkFlBrehzle9qNoGmU~tBwhf~TE0RpFqE7mvx54A9ICeh9KoqrZDnGeNrGU0Jp0AEOmQBAca-sEecY8NbWAxu8NsR6oVaB5Y~Mk72-K4xw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        couponValue: '90% Off',
      ),
    ];
    setPromotionalBanner(promotionalResult);

    List<ProductModel> productsResult = [
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A1",
        description: "Beosound A1",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A2",
        description: "Beosound A2",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A3",
        description: "Beosound A3",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A4",
        description: "Beosound A4",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A5",
        description: "Beosound A5",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A6",
        description: "Beosound A6",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A7",
        description: "Beosound A7",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
      ProductModel(
        id: "619d23869c71130f9ea3578d",
        name: "Beosound A8",
        description: "Beosound A8",
        price: 650,
        images: [
          "https://s3-alpha-sig.figma.com/img/2f3c/3311/1d275255be39fc89ebc02288911aa8dc?Expires=1647216000&Signature=MJ~-G1SX0HWcqjIEjqJJeDjk4MnlZ9deirSfeCSSS~1RlT1Ej-JEH6NvkKlYjyA1QwusMGkJkh9bKNvHynqYTkZrBJqiLeVpHkDJt3U7nT2QKJHmt0b5fXVrijB8hV~zkTARyFv8A2yIJG47wNYkHPgVGlQrjn~pfoPlch6M8UcOy6YXkNwPeNGMgcPZw7v9X1Uh4BJrof6v5kdI~qFC-w1Trfu3ZQw13i6u1rxLC7hrE-yKFoFSxos~sqSBY~QhXO0YwybaLMnW9lbnXTP-ztoRKR4lKFP~qwP-SIVG7b34FK0mBA2b7Qe3L3G79YahB7Dv9~sINYGoPLpE~HET~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ],
      ),
    ];
    setProducts(productsResult);

    setIsLoading(false);
    return 'success';
  }
}
