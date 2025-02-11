// File: lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v1_micro_finance/configs/models/signin_user_model.dart';

/// Service class for authentication-related API calls.
class AuthService {
  // API endpoint URL (returns a list of users)
  static const String _apiUrl = "http://84.247.161.200:9090/api/microbank/get";

  /// Attempts to log in with [email] and [password].
  /// Returns the matching [User] if credentials match; otherwise, returns null.
  static Future<User?> login(String email, String password) async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        for (var userJson in jsonData) {
          User user = User.fromJson(userJson);
          if (user.email == email && user.password == password) {
            return user;
          }
        }
        return null;
      }
      return null;
    } catch (e) {
      // Return null on any error.
      return null;
    }
  }
}
