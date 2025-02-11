import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _userIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Construct the email body
      final String emailBody = '''
Name: ${_nameController.text}
User ID: ${_userIdController.text}
Email: ${_emailController.text}
Subject: ${_subjectController.text}
Message: ${_messageController.text}
''';

      // Encode the email body for the URL
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'contact.junaead@gmail.com',
        queryParameters: {
          'subject': _subjectController.text,
          'body': emailBody,
        },
      );

      // Launch the email client
      if (await canLaunch(emailUri.toString())) {
        await launch(emailUri.toString());
      } else {
        throw 'Could not launch email client';
      }

      // Show success popup with animation
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Apply Succeeded'),
            content: SizedBox(
              height: 100,
              child: Center(
                child: Icon(
                  Icons.celebration,
                  color: Colors.amber,
                  size: 50,
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Help Screen",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // User ID Field
              TextFormField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your User ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Subject Field
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Message Field
              TextFormField(
                controller: _messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
