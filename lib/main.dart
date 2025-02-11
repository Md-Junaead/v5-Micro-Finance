import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

void main() {
  runApp(MicroFinance());
}

class MicroFinance extends StatelessWidget {
  const MicroFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FINSYS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color(0xFFFEF7FF), // Set background color globally
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF06426D), // Set AppBar color globally
        ),
      ),
      // this is the initial route indicating from where our app will start
      initialRoute: RoutesName.startedScreen,
      onGenerateRoute: Routes.generateRoute, // Name of Open screen
    );
  }
}
