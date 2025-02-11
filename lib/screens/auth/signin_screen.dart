// File: lib/screens/auth/sign_in_screen.dart

import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/configs/services/signin_auth_api_service.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
import 'package:v1_micro_finance/configs/widgets/bottom_nav_bar.dart';

import '../../configs/models/signin_user_model.dart'; // Replace with the correct path

/// A stateful widget that represents the sign-in screen.
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

/// The state for the SignInScreen.
class _SignInScreenState extends State<SignInScreen> {
  // Controller for the email input field.
  final TextEditingController _emailController = TextEditingController();
  // Controller for the password input field.
  final TextEditingController _passwordController = TextEditingController();

  /// Handles the login process.
  ///
  /// Checks if both email and password fields are filled, then calls the API to verify credentials.
  void _login() async {
    // Perform basic validation to ensure fields are not empty
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // Call the login function from AuthService with the provided email and password.
      User? user = await AuthService.login(
        _emailController.text,
        _passwordController.text,
      );

      // If a matching user is found, navigate to the BottomNavBar (user's account).
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      } else {
        // Show an error message if login fails.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid email or password."),
          ),
        );
      }
    } else {
      // Show an error message if any of the fields are empty.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter both email and password."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bank Logo/Image
              Center(
                child: Image.asset(
                  'assets/logos/login_icon_logo.png',
                  height: 250,
                ),
              ),
              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email', // Updated label to "Email"
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Password Input Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              // Log In Button
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF06426D),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),

              // Forgot Password Link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text(
                  'Forget Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8),

              // Sign-Up Link
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signupScreen);
                },
                child: Text(
                  'New to FINSYS? Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF06426D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
