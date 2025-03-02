import 'dart:convert';

class UserRegistration {
  final int id;
  final String userid;
  final String name;
  final String password;
  final String confirmPassword;
  final String email;
  final String phoneNo;
  final DateTime dob;
  final String address;
  final String country;
  final String image;
  final String referralCode;
  final String nidNumber;
  final String? passport;

  UserRegistration({
    required this.id,
    required this.userid,
    required this.name,
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.address,
    required this.country,
    required this.image,
    required this.referralCode,
    required this.nidNumber,
    this.passport,
  });

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
      id: json['id'],
      userid: json['userid'],
      name: json['name'],
      password: json['password'],
      confirmPassword: json['confirmpassword'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      dob: DateTime.parse(json['dob']),
      address: json['address'],
      country: json['country'],
      image: json['image'],
      referralCode: json['referralCode'],
      nidNumber: json['nidnumber'],
      passport: json['passport'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'name': name,
      'password': password,
      'confirmpassword': confirmPassword,
      'email': email,
      'phoneNo': phoneNo,
      'dob': dob.toIso8601String(),
      'address': address,
      'country': country,
      'image': image,
      'referralCode': referralCode,
      'nidnumber': nidNumber,
      'passport': passport,
    };
  }

  static List<UserRegistration> fromJsonList(String str) {
    return List<UserRegistration>.from(
        json.decode(str).map((x) => UserRegistration.fromJson(x)));
  }

  static String toJsonList(List<UserRegistration> users) {
    return json.encode(List<dynamic>.from(users.map((x) => x.toJson())));
  }
}
