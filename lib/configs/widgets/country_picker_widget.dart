import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryPickerWidget extends StatelessWidget {
  final String? selectedCountry;
  final Function(Country) onSelect;

  // Using super.key to pass the key to the superclass constructor
  const CountryPickerWidget({
    super.key, // Use super.key for the Key parameter
    this.selectedCountry,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Country', style: TextStyle(fontSize: 16)),
        TextFormField(
          readOnly: true,
          controller: TextEditingController(
              text: selectedCountry ?? "Select a country"),
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: onSelect,
            );
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          validator: (value) =>
              selectedCountry == null ? 'Please select your country' : null,
        ),
      ],
    );
  }
}
