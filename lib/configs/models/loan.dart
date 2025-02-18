class Loan {
  final int id;
  final double eligebleBalance;
  final double loanAmount;
  final double weeklyPay;
  final double totalPay;
  final int tenure;
  final String status;
  final DateTime requestDate;
  final UserRegistration userRegistration;
  final Balance balance;

  Loan({
    required this.id,
    required this.eligebleBalance,
    required this.loanAmount,
    required this.weeklyPay,
    required this.totalPay,
    required this.tenure,
    required this.status,
    required this.requestDate,
    required this.userRegistration,
    required this.balance,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      eligebleBalance: json['eligeblebalancey'].toDouble(),
      loanAmount: json['loanamuont'].toDouble(),
      weeklyPay: json['weeklypay'].toDouble(),
      totalPay: json['totalpay'].toDouble(),
      tenure: json['tenure'],
      status: json['status'],
      requestDate: DateTime.parse(json['requestdate']),
      userRegistration: UserRegistration.fromJson(json['userRegistration']),
      balance: Balance.fromJson(json['balance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eligeblebalancey': eligebleBalance,
      'loanamuont': loanAmount,
      'weeklypay': weeklyPay,
      'totalpay': totalPay,
      'tenure': tenure,
      'status': status,
      'requestdate': requestDate.toIso8601String(),
      'userRegistration': userRegistration.toJson(),
      'balance': balance.toJson(),
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
  final DateTime dob;
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

class Balance {
  final int id;
  final double addBalance;
  final double depositBalance;
  final String packages;
  final double profitBalance;
  final double referralBalance;
  final double withdrawBalance;
  final UserRegistration userRegistration;

  Balance({
    required this.id,
    required this.addBalance,
    required this.depositBalance,
    required this.packages,
    required this.profitBalance,
    required this.referralBalance,
    required this.withdrawBalance,
    required this.userRegistration,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      id: json['id'],
      addBalance: json['addBalance'].toDouble(),
      depositBalance: json['dipositB'].toDouble(),
      packages: json['packages'],
      profitBalance: json['profitB'].toDouble(),
      referralBalance: json['referralB'].toDouble(),
      withdrawBalance: json['withdrawB'].toDouble(),
      userRegistration: UserRegistration.fromJson(json['userRegistration']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'addBalance': addBalance,
      'dipositB': depositBalance,
      'packages': packages,
      'profitB': profitBalance,
      'referralB': referralBalance,
      'withdrawB': withdrawBalance,
      'userRegistration': userRegistration.toJson(),
    };
  }
}
