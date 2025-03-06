import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginModel {
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://108.181.173.121:7071/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );

      print("Response Code: ${response.statusCode}"); // Debugging

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("Response Data: $responseData"); // Debugging

        // Ensure the response contains a token
        if (responseData.containsKey('token')) {
          print("Login Successful! Token: ${responseData['token']}");
          return true;
        } else {
          print("Login Failed: Token not found in response.");
          return false;
        }
      } else {
        print("Login Error: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception during login: $e");
      return false;
    }
  }
}
