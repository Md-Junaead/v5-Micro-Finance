import 'dart:convert';

class ReferralModel {
  final int id;
  final String referral;
  final String referredByCode;
  final User user;

  ReferralModel({
    required this.id,
    required this.referral,
    required this.referredByCode,
    required this.user,
  });

  factory ReferralModel.fromJson(Map<String, dynamic> json) {
    return ReferralModel(
      id: json['id'],
      referral: json['referral'],
      referredByCode: json['referredbycode'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'referral': referral,
      'referredbycode': referredByCode,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String userId;
  final String password;
  final String name;
  final String email;
  final String phoneNo;
  final String dob;
  final String address;
  final String country;
  final String image;
  final String referralCode;

  User({
    required this.id,
    required this.userId,
    required this.password,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.address,
    required this.country,
    required this.image,
    required this.referralCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userId: json['userid'],
      password: json['password'],
      name: json['name'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      dob: json['dob'],
      address: json['address'],
      country: json['country'],
      image: json['image'],
      referralCode: json['referralCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userId,
      'password': password,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'dob': dob,
      'address': address,
      'country': country,
      'image': image,
      'referralCode': referralCode,
    };
  }
}

List<ReferralModel> referralModelFromJson(String str) =>
    List<ReferralModel>.from(
        json.decode(str).map((x) => ReferralModel.fromJson(x)));

String referralModelToJson(List<ReferralModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
