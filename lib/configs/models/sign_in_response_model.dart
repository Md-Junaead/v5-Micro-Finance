// File: lib/models/sign_in_response_model.dart

import 'package:v1_micro_finance/configs/models/signin_user_model.dart'; // Assuming you have a UserModel class to hold user info.

class SignInResponseModel {
  final String token; // Authentication token (e.g., JWT)
  final UserModel user; // User data (name, email, etc.)
  final String? errorMessage; // In case of failure, error message

  // Constructor for SignInResponseModel
  SignInResponseModel({
    required this.token,
    required this.user,
    this.errorMessage,
  });

  // Factory constructor to create a SignInResponseModel from JSON
  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      token: json['token'], // Assume the API returns a 'token'
      user: UserModel.fromJson(json['user']), // Parse user data
      errorMessage: json['errorMessage'], // Optional error message
    );
  }
}
