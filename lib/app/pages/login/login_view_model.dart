import 'package:flutter/material.dart';

class LoginProviderController with ChangeNotifier {
  String login = '';

  setLogin(String value) => login = value;
}