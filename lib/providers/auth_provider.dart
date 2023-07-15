import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool isLoading = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool isAuth) {
    _isAuthenticated = isAuth;
    notifyListeners();
  }

  AuthProvider() {
    //init
  }

  void signIn() async {
    isLoading = false;
    notifyListeners();
  }

  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
