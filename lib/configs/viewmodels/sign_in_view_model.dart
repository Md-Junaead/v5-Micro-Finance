// File: lib/viewmodels/sign_in_view_model.dart

import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/models/signin_user_model.dart';
import 'package:v1_micro_finance/configs/services/signin_auth_api_service.dart';

/// ViewModel for SignInScreen using MVVM architecture.
class SignInViewModel extends ChangeNotifier {
  // Controllers for the email and password input fields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false; // Indicates whether a login request is in progress.

  /// Calls [AuthService.login] using the text from the controllers.
  /// Returns true if login is successful (user found), otherwise false.
  Future<bool> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    isLoading = true;
    notifyListeners(); // Notify UI to update if needed.

    User? user = await AuthService.login(
      emailController.text,
      passwordController.text,
    );

    isLoading = false;
    notifyListeners();
    return user != null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
