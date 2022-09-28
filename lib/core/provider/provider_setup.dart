import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../app/pages/home/home_view_model.dart';
import '../../app/pages/introduction/introduction_view_model.dart';
import '../../app/pages/login/login_view_model.dart';
import '../../app/pages/main/bottom_navigation_bar_controller_view_model.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => HomeProviderController()),
  ChangeNotifierProvider(create: (_) => LoginProviderController()),
  ChangeNotifierProvider(create: (_) => IntroductionProviderController()),
  ChangeNotifierProvider(create: (_) => BottomNavigationBarProviderController()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
