import 'package:flutter/material.dart';
import 'package:ischool/data/classes.dart';
import 'package:ischool/data/data.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> authenticateUser(String email,String password) async {
    _isLoading = true;
    notifyListeners();

    try {


      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception("An error Occured trying to query students,$e");
    }
  }
}
