import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class LoanPolicy extends StatelessWidget {
  const LoanPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalMargin = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: const CommonAppBar(title: "Loan Policy"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                  'FINSYS Loan Feature: Instant Loans Tailored to Your Savings',
                  20,
                  true),
              _buildSection('Loan Details', 17, true),
              _buildContent([
                'Loan Amount: Borrow up to 80% of your total savings balance.',
                'Loan Tenure: Choose between 26 weeks (6 months) or 52 weeks (1 year).',
                'Interest Rate: 0.0137 higher than your existing profit rate.',
              ]),
              _buildSection('Repayment Terms', 17, true),
              _buildContent([
                'Weekly EMI: Repay the loan in easy weekly installments.',
                'Missed Payment Policy:',
                '  1st Missed: Profit withdrawal temporarily suspended.',
                '  2nd Missed: Profit generation stopped.',
                '  3rd Missed: Account suspended, outstanding loan adjusted.',
              ]),
              _buildSection('Additional Terms', 17, true),
              _buildContent([
                'Savings Withdrawal Restriction: Savings cannot be withdrawn during an active loan.',
              ]),
              _buildSection('Why Choose FINSYS Loans?', 17, true),
              _buildContent([
                'Instant access to funds when needed.',
                'Flexible tenure options.',
                'Transparent policies for a fair borrowing experience.',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String text, double size, bool bold) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(text,
          style: TextStyle(
              fontSize: size,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
    );
  }

  Widget _buildContent(List<String> texts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map((text) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(text, style: const TextStyle(fontSize: 16)),
              ))
          .toList(),
    );
  }
}
