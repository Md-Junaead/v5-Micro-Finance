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
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesName.startedScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;
    double negativeTopMargin = screenHeight * 0.05; // -5% of screen height

    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Transform.translate(
        offset: Offset(0,
            -negativeTopMargin), // Shift the image upward by -5% of screen height
        child: Center(
          child: Image.asset(
            'assets/splash/splash_screen.gif',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Ensures full-screen fit
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:v1_micro_finance/configs/routes/routes_name.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }

//   void _navigateToHome() async {
//     await Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, RoutesName.startedScreen);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Set background color
//       body: Center(
//         child: Image.asset(
//           'assets/splash/splash_screen.gif',
//           width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.cover, // Ensures full-screen fit
//         ),
//       ),
//     );
//   }
// }
