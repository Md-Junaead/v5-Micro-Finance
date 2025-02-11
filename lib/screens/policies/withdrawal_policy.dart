import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class WithdrawalPolicy extends StatelessWidget {
  const WithdrawalPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Withdrawal Policy"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FINSYS Fund Withdrawal Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'At FINSYS, we prioritize flexibility and convenience when it comes to managing your funds. Below is a detailed outline of our withdrawal policy:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Minimum Withdrawal Amount: \$1 USD',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Available Withdrawal Methods:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildWithdrawalMethod('FINSYS Payment Gateway'),
            _buildWithdrawalMethod('Bank Wire Transfers'),
            _buildWithdrawalMethod('Cryptocurrency Wallets'),
            _buildWithdrawalMethod('Local Agents'),
            _buildWithdrawalMethod('Other location-based options'),
            const SizedBox(height: 16),
            const Text(
              'Important Points:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildImportantPoint(
                '1. Review transaction fees and processing times before initiating any transaction.'),
            _buildImportantPoint(
                '2. Ensure your account complies with FINSYS policies and maintains sufficient balances for fees.'),
            _buildImportantPoint(
                '3. Withdrawal requests may be subject to additional security checks.'),
            const SizedBox(height: 16),
            const Text(
              'Experience Hassle-Free Transactions!',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Withdraw your funds easily, securely, and on your terms with FINSYS. For more details or assistance, contact our support team.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build withdrawal method list items
  Widget _buildWithdrawalMethod(String method) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              method,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build important points list items
  Widget _buildImportantPoint(String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              point,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
