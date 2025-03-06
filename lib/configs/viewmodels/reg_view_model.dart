import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRegistrationViewModel extends ChangeNotifier {
  String country = '';
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String referralCode = '';
  bool isPasswordValid = false;

  // Setters and validation
  void setCountry(String selectedCountry) {
    country = selectedCountry;
    notifyListeners();
  }

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    validatePassword();
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    validatePassword();
    notifyListeners();
  }

  void setReferralCode(String value) {
    referralCode = value;
    notifyListeners();
  }

  // Password validation
  void validatePassword() {
    isPasswordValid = password == confirmPassword;
  }

  Future<void> submitRegistration() async {
    if (isPasswordValid &&
        country.isNotEmpty &&
        name.isNotEmpty &&
        email.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('http://108.181.173.121:7071/api/userRegistration'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'country': country,
            'name': name,
            'email': email,
            'password': password,
            'confirmPassword': confirmPassword,
            'referralCode': referralCode,
          }),
        );

        if (response.statusCode == 200) {
          // Successfully registered
          print('Registration successful');
        } else {
          print('Failed to register');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}
