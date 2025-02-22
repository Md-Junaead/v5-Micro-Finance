// user_model.dart
class UserModel {
  final String userRole;
  // Add other user fields as needed

  UserModel({required this.userRole});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(userRole: json['userRole']);
  }
}
