// sign_in_response.dart
import 'package:v1_micro_finance/configs/models/signin_user_model.dart';

class SignInResponse {
  final String token;
  final UserModel user;

  SignInResponse({required this.token, required this.user});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
