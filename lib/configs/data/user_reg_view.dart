import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/viewmodels/user_viewmodel.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';
import 'package:v1_micro_finance/screens/auth/signin_screen.dart';

class SanaSignupScreen extends StatelessWidget {
  const SanaSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Scaffold(
        appBar: CommonAppBar(title: "Signup"),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Consumer<SignupViewModel>(
            builder: (context, viewModel, child) {
              return Form(
                key: viewModel.formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    _buildCountryPicker(viewModel, context),
                    _buildTextField(viewModel.nameController, 'Name', false),
                    _buildTextField(viewModel.emailController, 'Email', false),
                    _buildTextField(
                        viewModel.passwordController, 'Password', true),
                    _buildTextField(viewModel.confirmPasswordController,
                        'Confirm Password', true),
                    _buildTextField(viewModel.referralCodeController,
                        'Referral Code', false),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () => viewModel.saveUser(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF06426D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Sign UP',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
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
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (value) => value!.isEmpty ? 'Enter $label' : null,
      ),
    );
  }

  Widget _buildCountryPicker(SignupViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: false,
            onSelect: (Country country) {
              viewModel.selectedCountry = country.name;
              viewModel.notifyListeners();
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(viewModel.selectedCountry ?? 'Select a country',
              style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
