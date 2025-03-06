class UserRegistration {
  String country;
  String name;
  String email;
  String password;
  String confirmPassword;
  String referralCode;

  UserRegistration({
    required this.country,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.referralCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'referralCode': referralCode,
    };
  }
}
