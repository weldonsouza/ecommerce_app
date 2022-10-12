import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  String login = '';

  setLogin(String value) => login = value;
}