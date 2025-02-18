class balance {
  int? id;
  int? addBalance;
  int? dipositB;
  String? packages;
  double? profitB;
  int? referralB;
  double? withdrawB;
  UserRegistration? userRegistration;

  balance(
      {this.id,
      this.addBalance,
      this.dipositB,
      this.packages,
      this.profitB,
      this.referralB,
      this.withdrawB,
      this.userRegistration});

  balance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addBalance = json['addBalance'];
    dipositB = json['dipositB'];
    packages = json['packages'];
    profitB = json['profitB'];
    referralB = json['referralB'];
    withdrawB = json['withdrawB'];
    userRegistration = json['userRegistration'] != null
        ? new UserRegistration.fromJson(json['userRegistration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['addBalance'] = this.addBalance;
    data['dipositB'] = this.dipositB;
    data['packages'] = this.packages;
    data['profitB'] = this.profitB;
    data['referralB'] = this.referralB;
    data['withdrawB'] = this.withdrawB;
    if (this.userRegistration != null) {
      data['userRegistration'] = this.userRegistration!.toJson();
    }
    return data;
  }
}

class UserRegistration {
  int? id;
  String? userid;
  String? password;
  String? name;
  String? email;
  String? phoneNo;
  String? dob;
  String? address;
  String? country;
  String? image;
  String? referralCode;

  UserRegistration(
      {this.id,
      this.userid,
      this.password,
      this.name,
      this.email,
      this.phoneNo,
      this.dob,
      this.address,
      this.country,
      this.image,
      this.referralCode});

  UserRegistration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    dob = json['dob'];
    address = json['address'];
    country = json['country'];
    image = json['image'];
    referralCode = json['referralCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['password'] = this.password;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['country'] = this.country;
    data['image'] = this.image;
    data['referralCode'] = this.referralCode;
    return data;
  }
}
