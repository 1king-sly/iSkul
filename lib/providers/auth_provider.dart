import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<int> authenticateUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    int statusCode;

    try {
      if (email == "admin@gmail.com" && password == "password") {
        statusCode = 201;
      } else {
        statusCode = 401;
      }

      await Future.delayed(const Duration(seconds: 5));

      _isLoading = false;
      notifyListeners();
      return statusCode;
    } catch (e) {
      throw Exception("An error Occured trying to authenticate user,$e");
    }
  }
}
