// File: lib/models/user.dart

/// A model class that represents a user.
class User {
  final int id;
  final String userid;
  final String password;
  final String name;
  final String email;
  final String phoneNo;
  final DateTime dob;
  final String address;
  final String country;
  final String image;
  final String referralCode;

  User({
    required this.id,
    required this.userid,
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

  /// Factory method to create a User object from JSON data.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userid: json['userid'],
      password: json['password'],
      name: json['name'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      dob: DateTime.parse(json['dob']),
      address: json['address'],
      country: json['country'],
      image: json['image'],
      referralCode: json['referralCode'],
    );
  }

  /// Converts a User object into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'password': password,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'dob': dob.toIso8601String(),
      'address': address,
      'country': country,
      'image': image,
      'referralCode': referralCode,
    };
  }
}
