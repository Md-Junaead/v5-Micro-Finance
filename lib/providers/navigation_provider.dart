import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int get currentIndex => _currentIndex;
  GlobalKey<NavigatorState> get currentNavigator =>
      _navigatorKeys[_currentIndex];

  /// Updates the current index and notifies listeners
  void updateIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Returns the GlobalKey<NavigatorState> for a specific index
  GlobalKey<NavigatorState> getNavigatorKey(int index) {
    return _navigatorKeys[index];
  }
}
