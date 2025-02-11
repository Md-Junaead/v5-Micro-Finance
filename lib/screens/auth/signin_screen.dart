import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
import 'package:v1_micro_finance/configs/widgets/bottom_nav_bar.dart'; // Replace with the correct path

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Perform basic validation
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // Navigate to BottomNavBar on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else {
      // Show error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter both username and password."),
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
              // Heading
              // Text(
              //   'FINSYS',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 52,
              //     fontWeight: FontWeight.bold,
              //     color: Color(0xFF06426D),
              //   ),
              // ),
              // SizedBox(height: 15),
              // Username or Email Input Field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username or Email',
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
