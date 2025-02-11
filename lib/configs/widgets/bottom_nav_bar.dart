import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/bottom/home_screen.dart';
import 'package:v1_micro_finance/screens/bottom/statement_screen.dart';
import 'package:v1_micro_finance/screens/profile/profile.dart';
import 'package:v1_micro_finance/screens/bottom/notification.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Tracks the selected tab index

  // List of screens corresponding to each bottom navigation item
  final List<Widget> _screens = [
    HomeScreen(), // Home screen
    StatementScreen(), // About Us screen
    NotificationScreen(), // Loan screen
    UserProfile(), // Profile screen
  ];

  // Function to handle navigation when an icon is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index to switch screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Keep state when switching tabs
        children: _screens, // Display selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF06426D), // Background color
        selectedItemColor: Colors.white, // Selected icon color
        unselectedItemColor: Colors.white70, // Unselected icon color
        currentIndex: _selectedIndex, // Currently selected tab
        onTap: _onItemTapped, // Handle tap events
        type: BottomNavigationBarType.fixed, // Fix bottom navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Statement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.policy), label: 'Policy'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      //   onTap: (index) {
      //     // Handle navigation based on index
      //   },
      // ),