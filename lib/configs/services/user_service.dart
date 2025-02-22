import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v1_micro_finance/configs/models/reg_user_model.dart';

class UserService {
  final String apiUrl = 'http://84.247.161.200:9090/api/microbank/get';

  Future<List<UserRegistration>> fetchUser() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => UserRegistration.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load User");
    }
  }

  Future<void> userSave(UserRegistration user) async {
    final response = await http.post(
      Uri.parse('http://84.247.161.200:9090/api/microbank/save'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to save User');
    }
  }
}
