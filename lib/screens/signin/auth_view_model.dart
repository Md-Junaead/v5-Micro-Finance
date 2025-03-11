import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v1_micro_finance/screens/signin/user_model.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get user => _user;

  /// Handles user login
  Future<void> login(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    const String loginUrl = "http://108.181.173.121:7071/login";

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Login Successful: $data"); // Debugging

        // Save token & user email securely
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("authToken", data['token']);
        await prefs.setString("loggedInUserEmail", email); // Store email

        // Fetch User Info
        await fetchUserInfo(data['token']);

        // Navigate to User Info Screen
        Navigator.pushReplacementNamed(context, 'UserInfoScreen');
      } else {
        _errorMessage = "Invalid Email or Password";
        print("Login Failed: ${response.body}"); // Debugging
      }
    } catch (e) {
      _errorMessage = "Something went wrong. Try again!";
      print("Login Error: $e"); // Debugging
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Fetches logged-in user's information
  Future<void> fetchUserInfo(String token) async {
    const String userApi =
        "http://108.181.173.121:7071/api/userRegistration/get";

    try {
      final response = await http.get(
        Uri.parse(userApi),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Retrieve stored email of logged-in user
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? userEmail = prefs.getString("loggedInUserEmail");

        if (userEmail == null) {
          print("User email not found in local storage.");
          return;
        }

        // Handling List or Map response and filtering the correct user
        if (data is List) {
          // Find the correct user from the list based on email
          final userJson = data.firstWhere(
            (user) => user['email'] == userEmail,
            orElse: () => null, // Prevents errors if user is not found
          );

          if (userJson != null) {
            _user = User.fromJson(userJson);
            print("User Info Fetched: $_user"); // Debugging
          } else {
            print("No matching user found for email: $userEmail");
          }
        } else if (data is Map<String, dynamic>) {
          // If API directly returns a single user
          _user = User.fromJson(data);
          print("User Info Fetched: $_user"); // Debugging
        } else {
          print("Unexpected API response format.");
        }
      } else {
        print("Failed to Fetch User Info: ${response.body}"); // Debugging
      }
    } catch (e) {
      print("User Info Fetch Error: $e"); // Debugging
    }

    notifyListeners();
  }
}
