// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart'; // Import country picker package
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/widgets/comon_appbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController referCodeController =
      TextEditingController(); // Controller for refer code

  String? selectedCountry; // Variable to store selected country

  // API Call
  Future<void> registerUser(BuildContext context) async {
    const String apiUrl = "http://demo-api.com/api/signup"; // Demo API

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': fullNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
          'country': selectedCountry ?? "", // Send selected country
          if (referCodeController.text.isNotEmpty)
            'referCode':
                referCodeController.text, // Send refer code if provided
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          Navigator.pushNamed(context, RoutesName.verificationScreen);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
        }
      } else {
        throw Exception("Failed to register user.");
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "SignUp"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField(fullNameController, 'Full Name'),
              buildTextField(emailController, 'Email',
                  keyboardType: TextInputType.emailAddress),
              buildTextField(passwordController, 'Password', obscureText: true),
              buildTextField(confirmPasswordController, 'Confirm Password',
                  obscureText: true),

              // Country Selection Dropdown
              SizedBox(height: 1), // Minimized space to 12
              Text('Select Country', style: TextStyle(fontSize: 16)),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(
                    text: selectedCountry ?? "Select a country"),
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country.name;
                      });
                    },
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                validator: (value) {
                  if (selectedCountry == null) {
                    return 'Please select your country';
                  }
                  return null;
                },
              ),

              SizedBox(height: 5),
              buildTextField(referCodeController,
                  'Refer Code (Optional)'), // Refer Code Field

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF06426D), // Set button background color to black
                ),
                child: Text('Signup',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.signInScreen),
                child: Text('Already? Sign in',
                    style: TextStyle(fontSize: 14, color: Color(0xFF06426D))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable function to build text fields
  Widget buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return labelText.contains("Optional")
                ? null
                : 'Please enter your $labelText';
          }
          return null;
        },
      ),
    );
  }
}
