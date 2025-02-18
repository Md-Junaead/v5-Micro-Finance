// File: lib/configs/viewmodels/sign_in_view_model.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:v1_micro_finance/configs/models/sign_in_request_model.dart';
import 'dart:convert';

import 'package:v1_micro_finance/configs/models/sign_in_response_model.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  SignInResponseModel? signInResponse;

  // User data to be accessed after login
  String userRole = '';

  // Login method that uses SignInRequestModel and handles response with SignInResponseModel
  Future<bool> login() async {
    isLoading = true;
    notifyListeners();

    // Create SignInRequestModel with user input
    SignInRequestModel signInRequest = SignInRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    // Send the login request to the server
    final response = await http.post(
      Uri.parse(
          'http://84.247.161.200:9090/api/microbank/get'), // Replace with your actual endpoint
      body: json.encode(signInRequest.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Parse the response JSON
      signInResponse = SignInResponseModel.fromJson(json.decode(response.body));
      userRole = signInResponse?.user.userRole ??
          ''; // Assuming the response includes a userRole
      isLoading = false;
      notifyListeners();
      return true; // Successfully signed in
    } else {
      // If login fails, handle error
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
