import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v1_micro_finance/configs/core/api/api_constants.dart';
import 'package:v1_micro_finance/configs/models/sign_in_request_model.dart';
import 'package:v1_micro_finance/configs/models/sign_in_response_model.dart';

class AuthRepository {
  Future<SignInResponse> signIn(SignInRequest request) async {
    final uri = Uri.parse(ApiConstants.signIn).replace(
      queryParameters: {
        'email': request.email,
        'password': request.password,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return SignInResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login failed: ${response.reasonPhrase}');
    }
  }
}
