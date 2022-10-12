import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../app/pages/bag/bag_controller.dart';
import '../../app/pages/favorite/favorite_controller.dart';
import '../../app/pages/home/home_controller.dart';
import '../../app/pages/introduction/introduction_controller.dart';
import '../../app/pages/login/login_controller.dart';
import '../../app/pages/main/bottom_navigation_bar_controller.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(create: (_) => LoginController()),
  ChangeNotifierProvider(create: (_) => IntroductionController()),
  ChangeNotifierProvider(create: (_) => BottomNavigationBarController()),
  ChangeNotifierProvider(create: (_) => FavoriteController()),
  ChangeNotifierProvider(create: (_) => BagController()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
