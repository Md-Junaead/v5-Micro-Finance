import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  /// Sends a POST request to register a new user.
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
    // required String confirmPassword,
    required String country,
    String? referCode,
  }) async {
    const String apiUrl = "http://84.247.161.200:9090/api/microbank/save";
    final body = {
      'name': name,
      'email': email,
      'password': password,
      // 'confirmPassword': confirmPassword,
      'country': country,
      if (referCode != null && referCode.isNotEmpty) 'referCode': referCode,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to register user.");
    }
  }
}
