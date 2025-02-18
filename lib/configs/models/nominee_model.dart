class Nominee {
  final int id;
  final String name;
  final String email;
  final String cellNo;
  final DateTime dob;
  final String relationship;
  final User user;

  Nominee({
    required this.id,
    required this.name,
    required this.email,
    required this.cellNo,
    required this.dob,
    required this.relationship,
    required this.user,
  });

  factory Nominee.fromJson(Map<String, dynamic> json) {
    return Nominee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cellNo: json['cellNo'],
      dob: DateTime.parse(json['dob']),
      relationship: json['relationship'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cellNo': cellNo,
      'dob': dob.toIso8601String(),
      'relationship': relationship,
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
  final DateTime dob;
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
      dob: DateTime.parse(json['dob']),
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
      'dob': dob.toIso8601String(),
      'address': address,
      'country': country,
      'image': image,
      'referralCode': referralCode,
    };
  }
}
