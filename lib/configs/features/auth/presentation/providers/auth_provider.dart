import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/models/sign_in_request_model.dart';
import 'package:v1_micro_finance/configs/models/sign_in_response_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _repository = AuthRepository();

  bool _isLoading = false;
  String? _errorMessage;
  SignInResponse? _userData;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  SignInResponse? get userData => _userData;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = SignInRequest(email: email, password: password);
      _userData = await _repository.signIn(request);
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
