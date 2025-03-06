import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:v1_micro_finance/configs/viewmodels/reg_view_model.dart';
import 'package:v1_micro_finance/screens/auth/login_screen.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  // Controllers to hold the form input values
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _referralCodeController = TextEditingController();

  // Form Key for validation
  final _formKey = GlobalKey<FormState>();

  // To hold selected country
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    // Accessing UserProvider
    final userProvider = Provider.of<UserRegistrationViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Attach the form key for validation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Country Picker
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true, // Optional: Show country code
                      onSelect: (Country country) {
                        setState(() {
                          _selectedCountry = country; // Set selected country
                          userProvider.setCountry(
                            country.name,
                          ); // Update country in ViewModel
                        });
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double
                        .infinity, // Ensure the container takes full width
                    child: Text(
                      _selectedCountry == null
                          ? 'Select a country'
                          : _selectedCountry!.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Name Input
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      userProvider.setName(value); // Update name in ViewModel
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Email Input
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      userProvider.setEmail(value); // Update email in ViewModel
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Password Input with visibility toggle (same style as Name & Email)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            // Add your visibility toggle logic here if needed
                          });
                        },
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      userProvider.setPassword(
                        value,
                      ); // Update password in ViewModel
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Confirm Password Input with visibility toggle (same style as Name & Email)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            // Add your visibility toggle logic here if needed
                          });
                        },
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      userProvider.setConfirmPassword(
                        value,
                      ); // Update confirm password in ViewModel
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Referral Code Input
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _referralCodeController,
                    decoration: InputDecoration(
                      labelText: 'Referral Code',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    onChanged: (value) {
                      userProvider.setReferralCode(
                        value,
                      ); // Update referral code in ViewModel
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userProvider
                          .submitRegistration(); // Call submitRegistration without parameters
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06426D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),

                // Sign In link
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Already has an account? Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF06426D),
                        fontWeight: FontWeight.bold,
                      ),
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
