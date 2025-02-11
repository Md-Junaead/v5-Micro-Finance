import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/services/nominee_api_service.dart';
import '../models/nominee_model.dart';

class NomineeViewModel extends ChangeNotifier {
  Nominee? _nominee;
  bool _isLoading = true;

  Nominee? get nominee => _nominee;
  bool get isLoading => _isLoading;

  // Fetch nominee data and notify UI
  Future<void> fetchNomineeData() async {
    List<Nominee> nominees = await ApiService.fetchNominees();
    if (nominees.isNotEmpty) {
      _nominee = nominees.first; // Assuming we need only the first nominee
    }
    _isLoading = false;
    notifyListeners(); // Update UI
  }
}
