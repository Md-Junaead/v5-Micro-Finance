import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title
      appBar: const CommonAppBar(title: "Forgot Password"),

      // Body of the screen
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Heading text
            Text(
              'Reset Your Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF06426D),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Instruction text
            Text(
              'Enter your email address below',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Email input field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            // Reset Password button
            ElevatedButton(
              onPressed: () {
                // Handle reset password logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password reset instructions sent!'),
                  ),
                );
              },
              child: Text('Reset Password'),
            ),
            SizedBox(height: 16),

            // Back to Sign In link
            TextButton(
              onPressed: () {
                // Navigate back to the SignInScreen
                Navigator.pop(context);
              },
              child: Text(
                'Back to Sign In',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
