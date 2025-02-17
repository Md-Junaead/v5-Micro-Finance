// File: lib/configs/viewmodels/sign_in_view_model.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For converting JSON response

/// ViewModel class to handle business logic and state for SignIn.
class SignInViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading =
      false; // To manage the loading state during the login process
  String?
      userRole; // To store the user role after successful login (admin, customer, etc.)

  // This method handles the login process and updates the state.
  Future<bool> login() async {
    isLoading = true;
    notifyListeners(); // Notify the UI that the state has changed (loading)

    try {
      // Send a POST request to the API for login
      var response = await http.post(
        Uri.parse('http://84.247.161.200:9090/api/microbank/get'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response body and extract the role
        var data = jsonDecode(response.body);
        userRole = data['role']; // Assume the response contains a 'role' key

        return true; // Return true if login is successful
      } else {
        return false; // Return false if the status code is not 200
      }
    } catch (e) {
      return false; // Return false in case of an exception
    } finally {
      isLoading = false;
      notifyListeners(); // Notify that the loading state is finished
    }
  }
}
