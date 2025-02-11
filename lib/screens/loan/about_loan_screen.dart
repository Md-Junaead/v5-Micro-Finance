import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// Verification Screen

class AboutloanScreen extends StatefulWidget {
  const AboutloanScreen({super.key});

  @override
  State<AboutloanScreen> createState() => _AboutloanScreenState();
}

class _AboutloanScreenState extends State<AboutloanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "About Loan"),
      body: Center(
        child: Text('This is the About Loan screen'),
      ),
    );
  }
}
