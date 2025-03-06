import 'package:flutter/material.dart';
import '../models/login_model.dart';

class LoginViewModel with ChangeNotifier {
  final LoginModel _loginModel = LoginModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool isSuccess = await _loginModel.login(email, password);

    _isLoading = false;
    notifyListeners();
    return isSuccess;
  }
}
