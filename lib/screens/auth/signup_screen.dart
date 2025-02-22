import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/configs/viewmodels/signup_view_model.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';
import 'package:v1_micro_finance/configs/widgets/country_picker_widget.dart';
import 'package:v1_micro_finance/configs/widgets/reg_text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  final referCodeController = TextEditingController();

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    // Obtain the SignupViewModel from Provider
    final signupVM = Provider.of<SignupViewModel>(context);

    return Scaffold(
      appBar: const CommonAppBar(title: "SignUp"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFieldWidget(controller: fullNameController, label: 'Full Name'),SizedBox(height: 5),
              TextFieldWidget(controller: emailController, label: 'Email', keyboardType: TextInputType.emailAddress), SizedBox(height: 5),
              TextFieldWidget(controller: passwordController, label: 'Password', obscure: true), SizedBox(height: 5),
              // TextFieldWidget(controller: confirmPasswordController, label: 'Confirm Password', obscure: true), SizedBox(height: 5),
              // Country selection widget
              CountryPickerWidget(
                selectedCountry: selectedCountry,
                onSelect: (country) {
                  setState(() {
                    selectedCountry = country.name;
                  });
                },
              ),
              SizedBox(height: 8),
              TextFieldWidget(controller: referCodeController, label: 'Refer Code (Optional)'),
              const SizedBox(height: 16),
              // Show a loader while registering
              signupVM.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Call the view model to register the user
                          final result = await signupVM.register(
                            name: fullNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            // confirmPassword: confirmPasswordController.text,
                            country: selectedCountry ?? "",
                            referCode: referCodeController.text,
                          );
                          // Navigate or show error based on API response
                          if (result != null && result['status'] == 'success') {
                            Navigator.pushNamed(context, RoutesName.verificationScreen);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(signupVM.errorMessage ?? "Registration failed")),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF06426D)),
                      child: const Text('Signup', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, RoutesName.signInScreen),
                child: const Text('Already? Sign in', style: TextStyle(fontSize: 14, color: Color(0xFF06426D))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
