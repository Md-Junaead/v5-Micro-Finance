import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class BeneficiaryFunds extends StatelessWidget {
  const BeneficiaryFunds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Nominee Policy"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _policyContent(),
        ),
      ),
    );
  }

  List<Widget> _policyContent() {
    final policyData = [
      [
        'Nominee and Unclaimed Funds Policy',
        'At FINSYS, we prioritize transparency and accountability in managing your savings and profits. This section outlines the process for handling unclaimed funds and the role of your nominated beneficiary (nominee).'
      ],
      ['Unclaimed Funds Policy', ''],
      [
        '1. Definition of Unclaimed Funds:',
        "Savings and profit funds in a user's account are considered unclaimed if there is no activity or claim by the user for over 90 consecutive days."
      ],
      [
        '2. Steps to Contact the User:',
        "• Initial Contact: After 90 days of inactivity, FINSYS will contact the user via registered email and phone.\n"
            "• Follow-Up Contact: If no response within 15 working days, a second follow-up email will be sent.\n"
            "• Final Attempt: If still unresponsive after 7 more days, FINSYS will contact the nominee."
      ],
      ['Nominee Notification and Fund Disbursement', ''],
      [
        '1. Role of the Nominee:',
        'The nominee, designated during registration, serves as the beneficiary if the user cannot be reached.'
      ],
      [
        '2. Contacting the Nominee:',
        "• If the user remains unresponsive, FINSYS will contact the nominee.\n"
            "• The nominee will be informed and guided through verification."
      ],
      [
        '3. Verification Process:',
        "• The nominee must provide proof of identity (e.g., government-issued ID).\n"
            "• Verification will be completed within 30 days to prevent unauthorized access."
      ],
      [
        '4. Fund Disbursement:',
        "• Upon successful verification, funds will be transferred to the nominee per recorded instructions.\n"
            "• FINSYS will never share user credentials with the nominee."
      ],
      ['Important Notes:', ''],
      ['• Users must keep their nominee details updated.', ''],
      [
        '• FINSYS reserves the right to decline disbursement if verification fails.',
        ''
      ],
      ['• Disputes will be resolved per applicable laws and FINSYS terms.', ''],
      [
        'This policy ensures responsible fund management while safeguarding privacy and security.',
        ''
      ],
      [
        'For queries or nominee updates, contact FINSYS Customer Support at support@finsys.com.',
        ''
      ],
    ];

    return policyData
        .map((data) => _buildPolicyPoint(data[0], data[1]))
        .toList();
  }

  Widget _buildPolicyPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16)),
          ],
        ],
      ),
    );
  }
}
