// View: UI Implementation
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
              horizontal: MediaQuery.of(context).size.width *
                  0.05), // ✅ 5% margin from left & right
          child: Consumer<SignupViewModel>(
            builder: (context, viewModel, child) {
              return Form(
                key: viewModel.formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                        height: 20), // ✅ 5% margin from top for input fields
                    _buildTextField(
                        viewModel.passwordController, 'Password', true),
                    _buildTextField(viewModel.nameController, 'Name', false),
                    _buildTextField(viewModel.emailController, 'Email', false),
                    _buildTextField(
                        viewModel.phoneController, 'Phone Number', false),
                    _buildTextField(
                        viewModel.addressController, 'Address', false),
                    _buildDatePicker(viewModel, context),
                    _buildCountryPicker(viewModel, context),
                    const SizedBox(height: 5),

                    // Upload Image Button with Checkmark
                    ElevatedButton.icon(
                      onPressed: viewModel.pickImage,
                      icon: viewModel.image != null
                          ? const Icon(Icons.check_circle,
                              color: Colors
                                  .green) // ✅ Green checkmark after upload
                          : const Icon(Icons.upload_file),
                      label: const Text(
                        'Upload Image',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF06426D)), // ✅ Button text 14px
                      ),
                      style: ElevatedButton.styleFrom(
                        // ✅ Button color blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ), // ✅ Button border radius 15px
                          side: BorderSide(
                              color: Colors.black,
                              width: 1), // ✅ Black border with 1px width
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // ✅ Button height 20
                      ),
                    ),

                    const SizedBox(height: 5), // ✅ Spacing before Save button

                    // Save User Button with Blue Background
                    ElevatedButton(
                      onPressed: () => viewModel.saveUser(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF06426D), // ✅ Button color blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // ✅ Button border radius 15px
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // ✅ Button height 20
                      ),
                      child: const Text(
                        'Save User',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white), // ✅ Button text 14px
                      ),
                    ),

                    const SizedBox(height: 10), // ✅ Spacing before SignIn text

                    // Already has an account? SignIn Text
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreen()), // ✅ Navigate to SignIn
                        );
                      },
                      child: const Center(
                        child: Text(
                          'Already has an account? Sign In',
                          style: TextStyle(
                            fontSize: 16, // ✅ Text size 16px
                            color: Color(0xFF06426D), // ✅ Text color blue
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
      padding: const EdgeInsets.only(bottom: 8.0), // ✅ 8px gap from bottom
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            // ✅ 1px solid black border
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            // ✅ Border when input is active
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          floatingLabelBehavior:
              FloatingLabelBehavior.auto, // ✅ Moves label to top when typing
        ),
        validator: (value) => value!.isEmpty ? 'Enter $label' : null,
      ),
    );
  }

  Widget _buildDatePicker(SignupViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // ✅ 8px gap from bottom
      child: TextFormField(
        readOnly: true,
        decoration: const InputDecoration(labelText: 'Date of Birth'),
        controller: TextEditingController(
          text: viewModel.dob != null
              ? viewModel.dob!.toLocal().toString().split(' ')[0]
              : '',
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: viewModel.dob ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            viewModel.dob = pickedDate;
            viewModel.notifyListeners();
          }
        },
      ),
    );
  }

  Widget _buildCountryPicker(SignupViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // ✅ 8px gap from bottom
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
            border: Border.all(
                color: Colors.black, width: 1.0), // ✅ 1px solid black border
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(viewModel.selectedCountry ?? 'Select a country',
              style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
