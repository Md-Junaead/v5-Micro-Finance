// File: lib/models/sign_in_request_model.dart

class SignInRequestModel {
  final String email;
  final String password;

  // Constructor for SignInRequestModel
  SignInRequestModel({
    required this.email,
    required this.password,
  });

  // Convert SignInRequestModel to JSON (for API request)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
