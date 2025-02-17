// File: lib/screens/auth/sign_in_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/configs/viewmodels/sign_in_view_model.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
import 'package:v1_micro_finance/configs/widgets/bottom_nav_bar.dart'; // Replace with correct path

/// SignInScreen (View) using MVVM architecture.
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provide the SignInViewModel to the widget tree.
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder: (context, model, child) => Scaffold(
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
                    controller: model.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Input Field
                  TextField(
                    controller: model.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Log In Button
                  ElevatedButton(
                    onPressed: () async {
                      // Call the ViewModel's login method.
                      bool success = await model.login();
                      if (success) {
                        // On successful login, navigate to the user's account (BottomNavBar).
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()),
                        );
                      } else {
                        // Show error message if login fails.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid email or password."),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF06426D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Forgot Password Link
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Forget Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Sign-Up Link
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.sanaSignupScreen);
                    },
                    child: const Text(
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
        ),
      ),
    );
  }
}
