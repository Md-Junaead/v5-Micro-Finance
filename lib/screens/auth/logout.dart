import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// LogOut Screen

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Logout"),
      body: Center(
        child: Text('This is the LogOut screen'),
      ),
    );
  }
}
