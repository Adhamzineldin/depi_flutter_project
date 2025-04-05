import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String username = '';
  String password = '';
  bool rememberMe = true;

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }

  bool get isFormValid => username.isNotEmpty && password.isNotEmpty;
}
