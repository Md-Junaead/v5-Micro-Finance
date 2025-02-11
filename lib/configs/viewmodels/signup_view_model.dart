import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/services/reg_api_service.dart';

class SignupViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Registers the user using the provided credentials.
  Future<Map<String, dynamic>?> register({
    required String name,
    required String email,
    required String password,
    // required String confirmPassword,
    required String country,
    String? referCode,
  }) async {
    _setLoading(true);
    try {
      final result = await ApiService.registerUser(
        name: name,
        email: email,
        password: password,
        // confirmPassword: confirmPassword,
        country: country,
        referCode: referCode,
      );
      _errorMessage = null;
      return result;
    } catch (e) {
      _errorMessage = e.toString();
      return null;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
