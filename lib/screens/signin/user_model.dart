class User {
  final int id;
  final String userid;
  final String name;
  final String email;
  final String password;
  final String? phoneNo;
  final String? address;
  final String country;
  final String? dob;
  final String referralCode;
  final String? nidnumber;
  final String? passport;
  final bool active;
  final String role;
  final bool enabled;
  final String username;
  final List<Authority> authorities;
  final bool lock;
  final bool accountNonLocked;
  final bool accountNonExpired;
  final bool credentialsNonExpired;

  User({
    required this.id,
    required this.userid,
    required this.name,
    required this.email,
    required this.password,
    this.phoneNo,
    this.address,
    required this.country,
    this.dob,
    required this.referralCode,
    this.nidnumber,
    this.passport,
    required this.active,
    required this.role,
    required this.enabled,
    required this.username,
    required this.authorities,
    required this.lock,
    required this.accountNonLocked,
    required this.accountNonExpired,
    required this.credentialsNonExpired,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userid: json['userid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNo: json['phoneNo'],
      address: json['address'],
      country: json['country'],
      dob: json['dob'],
      referralCode: json['referralCode'],
      nidnumber: json['nidnumber'],
      passport: json['passport'],
      active: json['active'],
      role: json['role'],
      enabled: json['enabled'],
      username: json['username'],
      authorities: (json['authorities'] as List)
          .map((e) => Authority.fromJson(e))
          .toList(),
      lock: json['lock'],
      accountNonLocked: json['accountNonLocked'],
      accountNonExpired: json['accountNonExpired'],
      credentialsNonExpired: json['credentialsNonExpired'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'name': name,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'address': address,
      'country': country,
      'dob': dob,
      'referralCode': referralCode,
      'nidnumber': nidnumber,
      'passport': passport,
      'active': active,
      'role': role,
      'enabled': enabled,
      'username': username,
      'authorities': authorities.map((e) => e.toJson()).toList(),
      'lock': lock,
      'accountNonLocked': accountNonLocked,
      'accountNonExpired': accountNonExpired,
      'credentialsNonExpired': credentialsNonExpired,
    };
  }
}

class Authority {
  final String authority;

  Authority({required this.authority});

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(authority: json['authority']);
  }

  Map<String, dynamic> toJson() {
    return {'authority': authority};
  }
}
