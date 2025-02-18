class UserRegistration {
  int id;

  String userid;
  String password;
  String name;
  String email;
  String phoneNo;
  DateTime dob;
  String address;
  String? country;
  String? image;

  String? referralCode;

  UserRegistration({
    required this.id,
    required this.userid,
    required this.password,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.address,
    this.country,
    this.image,
    this.referralCode,
  });

  // Convert JSON to UserRegistration instance
  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
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

  // Convert UserRegistration instance to JSON
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
