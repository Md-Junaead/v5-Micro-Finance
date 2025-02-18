// user_view_model.dart
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:v1_micro_finance/configs/models/user.dart';

class UserViewModel extends ChangeNotifier {
  User? _user;
  bool _isBalanceVisible = false;

  User? get user => _user;
  bool get isBalanceVisible => _isBalanceVisible;

  Future<void> fetchUserData() async {
    try {
      final response = await http
          .get(Uri.parse('http://84.247.161.200:9090/api/microbank/get'));
      if (response.statusCode == 200) {
        _user = User.fromJson(json.decode(response.body));
        notifyListeners();
      }
    } catch (error) {
      if (kDebugMode) print('Error fetching user data: $error');
    }
  }

  Future<void> fetchBalance() async {
    try {
      final response = await http
          .get(Uri.parse('http://84.247.161.200:9090/api/microbank/get'));
      if (response.statusCode == 200) {
        _user = User.fromJson(json.decode(response.body));
        _isBalanceVisible = true;
        notifyListeners();
        Future.delayed(const Duration(seconds: 8), () {
          _isBalanceVisible = false;
          notifyListeners();
        });
      }
    } catch (error) {
      if (kDebugMode) print('Error fetching balance: $error');
    }
  }
}
