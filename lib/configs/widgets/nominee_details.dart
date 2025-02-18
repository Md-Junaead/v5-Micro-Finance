import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/nominee_model.dart';

class NomineeDetails extends StatelessWidget {
  final Nominee nominee;

  const NomineeDetails({super.key, required this.nominee});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(Icons.person, 'Nominee Name:', nominee.name),
        _buildDetailRow(Icons.email, 'Email:', nominee.email),
        _buildDetailRow(Icons.phone, 'Phone Number:', nominee.cellNo),
        _buildDetailRow(Icons.cake, 'Date of Birth:', _formatDate(nominee.dob)),
        _buildDetailRow(
            Icons.group, 'Relation with User:', nominee.relationship),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/editProfileScreen'),
            child: const Text('Edit'),
          ),
        ),
      ],
    );
  }

  // Common method for displaying nominee details
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // Helper method to format DateTime
  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
