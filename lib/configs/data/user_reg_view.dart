// View: UI Implementation
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/viewmodels/user_viewmodel.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class SanaSignupScreen extends StatelessWidget {
  const SanaSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Scaffold(
        appBar: CommonAppBar(title: "SanaSignup"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<SignupViewModel>(
            builder: (context, viewModel, child) {
              return Form(
                key: viewModel.formKey,
                child: ListView(
                  children: [
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
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: viewModel.pickImage,
                        child: const Text('Upload Image')),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => viewModel.saveUser(context),
                        child: const Text('Save User')),
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
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: label),
      validator: (value) => value!.isEmpty ? 'Enter $label' : null,
    );
  }

  Widget _buildDatePicker(SignupViewModel viewModel, BuildContext context) {
    return TextFormField(
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
    );
  }

  Widget _buildCountryPicker(SignupViewModel viewModel, BuildContext context) {
    return GestureDetector(
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
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Text(viewModel.selectedCountry ?? 'Select a country',
            style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
