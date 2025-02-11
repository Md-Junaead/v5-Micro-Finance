// File: lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v1_micro_finance/configs/models/signin_user_model.dart';

/// A service class that handles authentication related API calls.
class AuthService {
  // API endpoint URL (returns a list of users)
  static const String _apiUrl = "http://84.247.161.200:9090/api/microbank/get";

  /// Logs in a user by checking the provided [email] and [password] against the API.
  ///
  /// Returns the matching [User] if found, or `null` if no match is found.
  static Future<User?> login(String email, String password) async {
    try {
      // Call the API endpoint
      final response = await http.get(Uri.parse(_apiUrl));

      // Check if the API call was successful
      if (response.statusCode == 200) {
        // Decode the JSON response into a list of dynamic objects
        List<dynamic> jsonData = jsonDecode(response.body);

        // Iterate over each user object in the JSON data
        for (var userJson in jsonData) {
          // Create a User object from JSON
          User user = User.fromJson(userJson);
          // Check if the email and password match
          if (user.email == email && user.password == password) {
            // Return the matched user
            return user;
          }
        }
        // Return null if no matching user is found
        return null;
      } else {
        // Return null if the API call failed
        return null;
      }
    } catch (e) {
      // Handle any exceptions and return null
      return null;
    }
  }
}
