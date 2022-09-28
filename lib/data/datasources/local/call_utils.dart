import 'package:ecommerce_app/core/provider/global_providers.dart';

class CallUtils {
  final userLocal = setupLocator.serviceLocatorUserLocal;

  Future<String?> createGetHeader() async {
    return await userLocal.getAuthToken();
  }
}