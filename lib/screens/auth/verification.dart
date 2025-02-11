import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// Verification Screen

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Verification"),
      body: Center(
        child: Text('This is the verification screen'),
      ),
    );
  }
}
