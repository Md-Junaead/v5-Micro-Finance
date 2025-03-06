import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
import '../../configs/viewmodels/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

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
                  'assets/logos/login_icon_logo.png', // Ensure the logo path is correct
                  height: 250,
                ),
              ),
              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              // Log In Button
              Consumer<LoginViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();

                            bool success =
                                await viewModel.login(email, password);

                            if (success) {
                              // Navigate to Home Screen on successful login
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.bottomNavBar);
                              });
                            } else {
                              // Show error message if login fails
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid email or password"),
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
                        );
                },
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
                  Navigator.pushNamed(
                      context, RoutesName.userRegistrationScreen); //Data folder
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
    );
  }
}
