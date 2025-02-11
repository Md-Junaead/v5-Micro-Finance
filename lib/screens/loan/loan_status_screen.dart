import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// Verification Screen

class LoanStatusScreen extends StatefulWidget {
  const LoanStatusScreen({super.key});

  @override
  State<LoanStatusScreen> createState() => _LoanStatusScreenState();
}

class _LoanStatusScreenState extends State<LoanStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Loan Status"),
      body: Center(
        child: Text('This is the Loan Status Screen'),
      ),
    );
  }
}
