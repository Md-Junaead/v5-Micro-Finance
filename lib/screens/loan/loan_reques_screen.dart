import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/withdraw/loan/loan_gateway.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// Verification Screen

class LoanRequestScreen extends StatefulWidget {
  const LoanRequestScreen({super.key});

  @override
  State<LoanRequestScreen> createState() => _LoanRequestScreenState();
}

class _LoanRequestScreenState extends State<LoanRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Loan Gateway"),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoanGateway()), // Navigate
            );
          },
          child: const Text(
            'Loan Page with calculator &  Next Buttton',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
