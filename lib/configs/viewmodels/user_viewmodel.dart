// ViewModel: Handles the business logic
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SignupViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  DateTime? dob;
  String? selectedCountry;
  XFile? selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Picks image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = pickedFile;
      notifyListeners();
    }
  }

  // Saves user data to the API
  Future<void> saveUser(BuildContext context) async {
    if (!formKey.currentState!.validate() ||
        selectedCountry == null ||
        selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please complete the form and upload an image.')),
      );
      return;
    }

    final user = {
      'id': 0,
      'password': passwordController.text,
      'name': nameController.text,
      'email': emailController.text,
      'phoneNo': phoneController.text,
      'dob': dob?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'address': addressController.text,
      'country': selectedCountry,
      'image': '',
    };

    var uri = Uri.parse('http://84.247.161.200:9090/api/microbank/save');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      http.MultipartFile.fromString('userRegistration', jsonEncode(user),
          contentType: MediaType('application', 'json')),
    );
    request.files.add(
      await http.MultipartFile.fromPath('image', selectedImage!.path,
          contentType: MediaType('image', 'jpeg')),
    );

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User added successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to add user. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while adding user.')),
      );
    }
  }
}
