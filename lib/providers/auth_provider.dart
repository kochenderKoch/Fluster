import 'package:flutter/material.dart';

/// Provider for Auth
class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  /// Is waiting
  bool isLoading = false;

  /// Get the Authentication Status
  bool get isAuthenticated => _isAuthenticated;

  /// Set the Authentication Status
  set isAuthenticated(bool isAuth) {
    _isAuthenticated = isAuth;
    notifyListeners();
  }

  /// Account sign in
  Future<void> signIn() async {
    isLoading = false;
    notifyListeners();
  }

  /// Account sign out
  Future<void> signOut() async {
    _isAuthenticated = false;
    notifyListeners();
  }
}
