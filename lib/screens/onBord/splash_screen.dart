import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesName.startedScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color
      body: Center(
        child: Image.asset(
          'assets/splash/splash_screen.gif',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover, // Ensures full-screen fit
        ),
      ),
    );
  }
}
