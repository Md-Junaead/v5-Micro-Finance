import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/signin/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // Make the layout scrollable
        child: Center(
          // Center the entire content
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight *
                  0.1, // -2% margin top (converted to positive value)
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center align the content vertically
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
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Log In Button (updated design)
                authProvider.isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double
                            .infinity, // Same width as Email & Password fields
                        child: ElevatedButton(
                          onPressed: () {
                            authProvider.login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
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
                      ),
                if (authProvider.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(authProvider.errorMessage!,
                        style: const TextStyle(color: Colors.red)),
                  ),
                const SizedBox(height: 16),
                // Forgot Password Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.forgotPasswordScreen); //Data folder
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
                    Navigator.pushNamed(context,
                        RoutesName.userRegistrationScreen); //Data folder
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
    );
  }
}
