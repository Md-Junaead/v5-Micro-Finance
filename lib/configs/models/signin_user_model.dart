// File: lib/models/user_model.dart

class UserModel {
  final String name;
  final String email;
  final String userRole;

  // Constructor for UserModel
  UserModel({
    required this.name,
    required this.email,
    required this.userRole,
  });

  // Factory constructor to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      userRole: json['userRole'],
    );
  }
}
