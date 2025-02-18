import 'dart:convert';

class BalanceModel {
  final int id;
  final double addBalance;
  final double dipositB;
  final String packages;
  final double profitB;
  final double referralB;
  final double withdrawB;
  final UserRegistration userRegistration;

  BalanceModel({
    required this.id,
    required this.addBalance,
    required this.dipositB,
    required this.packages,
    required this.profitB,
    required this.referralB,
    required this.withdrawB,
    required this.userRegistration,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      id: json['id'],
      addBalance: (json['addBalance'] as num).toDouble(),
      dipositB: (json['dipositB'] as num).toDouble(),
      packages: json['packages'],
      profitB: (json['profitB'] as num).toDouble(),
      referralB: (json['referralB'] as num).toDouble(),
      withdrawB: (json['withdrawB'] as num).toDouble(),
      userRegistration: UserRegistration.fromJson(json['userRegistration']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'addBalance': addBalance,
      'dipositB': dipositB,
      'packages': packages,
      'profitB': profitB,
      'referralB': referralB,
      'withdrawB': withdrawB,
      'userRegistration': userRegistration.toJson(),
    };
  }
}

class UserRegistration {
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

  UserRegistration({
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

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
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

List<BalanceModel> balanceModelFromJson(String str) => List<BalanceModel>.from(
    json.decode(str).map((x) => BalanceModel.fromJson(x)));

String balanceModelToJson(List<BalanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
