import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy for FINSYS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Effective Date: 1st February 2025',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('1. Information We Collect'),
            _buildSectionContent([
              '- Personal Information: Name, phone number, email address, and government-issued identification (e.g., NID, passport).',
              '- Financial Information: Bank account details, transaction history, savings amounts, and loan-related data.',
              '- Device Information: IP address, device type, operating system, and app usage data for security and performance improvement.',
              '- Location Information: We may collect your location data to verify transactions and improve service delivery.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('2. How We Use Your Information'),
            _buildSectionContent([
              '- Facilitate your savings, withdrawals, and loan processing.',
              '- Provide daily revenue calculations and financial updates.',
              '- Ensure the security of your account and prevent unauthorized access.',
              '- Conduct identity verification and fraud detection.',
              '- Offer customer support and respond to your queries.',
              '- Improve our app functionality and user experience.',
              '- Comply with legal obligations and regulatory requirements.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('3. Information Sharing'),
            _buildSectionContent([
              '- With Service Providers: Trusted third-party partners who assist in delivering financial services, app maintenance, and customer support.',
              '- For Legal Compliance: When required by law, regulation, or government authority to protect FINSYS, its users, or others.',
              '- With Your Consent: If you authorize us to share your data with a specific entity or for a specific purpose.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('4. Data Security'),
            _buildSectionContent([
              '- End-to-end encryption for sensitive information.',
              '- Secure servers and firewalls to prevent unauthorized access.',
              '- Regular system audits and updates to maintain data safety.',
              '- While we strive to protect your information, no system is entirely secure, and we cannot guarantee absolute security.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('5. Your Rights'),
            _buildSectionContent([
              '- Access and update your personal information.',
              '- Request deletion of your data, subject to legal and contractual obligations.',
              '- Opt-out of non-essential communications, such as marketing updates.',
              '- Lodge a complaint with the relevant authority if you believe your data privacy has been violated.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('6. Data Retention'),
            _buildSectionContent([
              '- We retain your data only for as long as necessary to provide our services and comply with legal obligations.',
              '- If your account is inactive for an extended period, we may delete your data, as permitted by law.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('7. Cookies and Tracking Technologies'),
            _buildSectionContent([
              '- FINSYS may use cookies and similar technologies to enhance your user experience, analyze app usage, and personalize services.',
              '- You can manage your cookie preferences through your device settings.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('8. Third-Party Links'),
            _buildSectionContent([
              '- Our app and website may contain links to third-party services.',
              '- We are not responsible for the privacy practices or content of these external platforms.',
              '- Please review their privacy policies before sharing your information.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('9. Updates to This Policy'),
            _buildSectionContent([
              '- We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements.',
              '- Users will be notified of significant changes via email or app notifications.',
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('10. Contact Us'),
            _buildSectionContent([
              '- Email: support@finsys.com',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(List<String> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            item,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
