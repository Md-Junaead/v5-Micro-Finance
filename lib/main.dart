import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:v1_micro_finance/configs/routes/routes.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/configs/viewmodels/reg_view_model.dart';
import 'package:v1_micro_finance/configs/viewmodels/user_view_model.dart';
import 'package:v1_micro_finance/configs/viewmodels/login_view_model.dart';

void main() {
  runApp(
    // Wrap the entire app with Multi
    //Provider to make SignupViewModel available
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(
            create: (context) => UserRegistrationViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel())
      ],
      child: MicroFinance(),
    ),
  );
}

class MicroFinance extends StatelessWidget {
  const MicroFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FINSYS',
      // // flutter build apk --build-name=1.0 --build-number=1
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color(0xFFFEF7FF), // Set background color globally
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF06426D), // Set AppBar color globally
        ),
      ),
      // This is the initial route indicating from where our app will start
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute, // Route generator for navigation
    );
  }
}
