import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome Admin Text
            const Text(
              'Welcome Admin',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            // A simple Button for Dashboard functionality (example)
            ElevatedButton(
              onPressed: () {
                // Navigate to another screen or perform an action
                // Placeholder for button action
              },
              child: const Text('View Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
