import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/features/auth/presentation/providers/auth_provider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/auth/forgot_password.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin(AuthProvider auth, BuildContext context) async {
    await auth.signIn(_emailController.text, _passwordController.text);

    if (auth.userData != null) {
      Navigator.pushNamed(
        context,
        auth.userData!.user.userRole == 'admin'
            ? RoutesName.adminDashboard
            : RoutesName.homeScreen,
      );
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Bank Logo/Image
                Center(
                  child: Image.asset(
                    'assets/logos/login_icon_logo.png',
                    height: 250,
                  ),
                ),
                // Email Input Field
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Password Input Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                // Log In Button
                ElevatedButton(
                  onPressed:
                      auth.isLoading ? null : () => _handleLogin(auth, context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: auth.isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF06426D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                // Forgot Password Link
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: const Text(
                    'Forget Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Sign-Up Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.sanaSignupScreen);
                  },
                  child: const Text(
                    'New to FINSYS? Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF06426D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:v1_micro_finance/configs/features/auth/presentation/providers/auth_provider.dart';
// import 'package:v1_micro_finance/configs/routes/routes_name.dart';
// import 'package:v1_micro_finance/screens/auth/forgot_password.dart';

// class SignInScreen extends StatelessWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<AuthProvider>(
//         builder: (context, auth, _) => SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Logo Section
//               _buildLogo(),
//               // Input Fields
//               _buildEmailField(),
//               _buildPasswordField(),
//               // Login Button
//               _buildLoginButton(auth, context),
//               // Helper Links
//               _buildForgotPassword(context),
//               _buildSignUpLink(context),
//               // Error Message
//               if (auth.errorMessage != null) _buildErrorWidget(auth),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo() =>
//       Image.asset('assets/logos/login_icon_logo.png', height: 250);

//   Widget _buildEmailField() => TextField(
//         controller: _emailController,
//         decoration:
//             InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
//       );

//   Widget _buildPasswordField() => TextField(
//         controller: _passwordController,
//         obscureText: true,
//         decoration: InputDecoration(
//             labelText: 'Password', border: OutlineInputBorder()),
//       );

//   Widget _buildLoginButton(AuthProvider auth, BuildContext context) {
//     return ElevatedButton(
//       onPressed: auth.isLoading ? null : () => _handleLogin(auth, context),
//       child: auth.isLoading
//           ? CircularProgressIndicator()
//           : Text('LOG IN', style: TextStyle(color: Color(0xFF06426D))),
//     );
//   }

//   void _handleLogin(AuthProvider auth, BuildContext context) async {
//     await auth.signIn(_emailController.text, _passwordController.text);

//     if (auth.userData != null) {
//       Navigator.pushNamed(
//         context,
//         auth.userData!.user.userRole == 'admin'
//             ? RoutesName.adminDashboard
//             : RoutesName.homeScreen,
//       );
//     }
//   }

//   Widget _buildForgotPassword(BuildContext context) => TextButton(
//         onPressed: () => Navigator.push(
//             context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen())),
//         child: Text('Forgot Password?'),
//       );

//   Widget _buildSignUpLink(BuildContext context) => TextButton(
//         onPressed: () =>
//             Navigator.pushNamed(context, RoutesName.sanaSignupScreen),
//         child: Text('New to FINSYS? Sign Up'),
//       );

//   Widget _buildErrorWidget(AuthProvider auth) => Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Text(auth.errorMessage!, style: TextStyle(color: Colors.red)),
//       );
// }

// // File: lib/screens/auth/sign_in_screen.dart

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:v1_micro_finance/configs/viewmodels/sign_in_view_model.dart';
// import 'package:v1_micro_finance/screens/auth/forgot_password.dart';
// import 'package:v1_micro_finance/configs/routes/routes_name.dart';

// /// SignInScreen (View) using MVVM architecture.
// class SignInScreen extends StatelessWidget {
//   const SignInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Provide the SignInViewModel to the widget tree using Provider.
//     return ChangeNotifierProvider(
//       create: (_) => SignInViewModel(),
//       child: Consumer<SignInViewModel>(
//         builder: (context, model, child) => Scaffold(
//           body: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Bank Logo/Image
//                   Center(
//                     child: Image.asset(
//                       'assets/logos/login_icon_logo.png',
//                       height: 250,
//                     ),
//                   ),
//                   // Email Input Field
//                   TextField(
//                     controller: model.emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   // Password Input Field
//                   TextField(
//                     controller: model.passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   // Log In Button
//                   ElevatedButton(
//                     onPressed: model.isLoading
//                         ? null
//                         : () async {
//                             // Call the ViewModel's login method.
//                             bool success = await model.login();
//                             if (success) {
//                               // Navigate based on user role
//                               if (model.userRole == 'admin') {
//                                 // Navigate to admin screen
//                                 Navigator.pushNamed(
//                                     context, RoutesName.adminDashboard);
//                               } else {
//                                 // Navigate to customer screen
//                                 Navigator.pushNamed(
//                                     context, RoutesName.homeScreen);
//                               }
//                             } else {
//                               // Show error message if login fails
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text("Invalid email or password.")),
//                               );
//                             }
//                           },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         side: const BorderSide(
//                           color: Colors.black,
//                           width: 1.0,
//                         ),
//                       ),
//                     ),
//                     child: model.isLoading
//                         ? const CircularProgressIndicator() // Show loading spinner when logging in
//                         : const Text(
//                             'LOG IN',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF06426D),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                   ),
//                   const SizedBox(height: 16),
//                   // Forgot Password Link
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ForgotPasswordScreen()),
//                       );
//                     },
//                     child: const Text(
//                       'Forget Password?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Sign-Up Link
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, RoutesName.sanaSignupScreen);
//                     },
//                     child: const Text(
//                       'New to FINSYS? Sign Up',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF06426D),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
