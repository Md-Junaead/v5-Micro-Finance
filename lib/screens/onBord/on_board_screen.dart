import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Slider
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height, // Full screen height
              autoPlay: true, // Enables auto sliding
              autoPlayInterval: Duration(seconds: 3), // 3 sec duration
              viewportFraction: 1.0, // Ensures full width coverage
              enableInfiniteScroll: true, // Infinite loop of images
            ),
            items: [
              // 'assets/images/image_one.png',
              'assets/images/image_one.webp',
              'assets/images/image_two.webp',
              'assets/images/image_three.webp',
              'assets/images/image_four.webp',
            ].map((imagePath) {
              return Container(
                width: MediaQuery.of(context).size.width, // Full width
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover, // Covers entire screen
                  ),
                ),
              );
            }).toList(),
          ),

          // Buttons Section
          Positioned(
            bottom:
                MediaQuery.of(context).size.height * 0.1, // Position buttons
            left: MediaQuery.of(context).size.width * 0.12,
            right: MediaQuery.of(context).size.width * 0.12,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space buttons
              children: [
                _buildButton(context, 'Login', () {
                  Navigator.pushNamed(context,
                      RoutesName.loginScreen); // Navigates to login screen
                }),
                _buildButton(context, 'Get Started', () {
                  Navigator.pushNamed(
                      context,
                      RoutesName
                          .userRegistrationScreen); // Navigates to signup screen
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create buttons
  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.05, // Button height 5% of screen
      child: ElevatedButton(
        onPressed: onPressed, // Click event for button
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for buttons
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black, // Text color
            fontFamily: 'Averia Libre', // Font family for button text
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:v1_micro_finance/configs/routes/routes_name.dart';

// class StartedScreen extends StatelessWidget {
//   const StartedScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Screen height and width for responsive design
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image Slider
//           CarouselSlider(
//             options: CarouselOptions(
//               height: screenHeight, // Full screen height
//               autoPlay: true, // Enables auto sliding
//               autoPlayInterval: Duration(seconds: 3), // 3 sec duration
//               viewportFraction: 1.0, // Ensures full width coverage
//               enableInfiniteScroll: true, // Infinite loop of images
//             ),
//             items: [
//               'assets/images/image_one.webp',
//               'assets/images/image_two.webp',
//               'assets/images/image_three.webp',
//               'assets/images/image_four.webp',
//             ].map((imagePath) {
//               return Container(
//                 width: screenWidth, // Full width
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(imagePath),
//                     fit: BoxFit.cover, // Makes sure images fit the screen
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//           // Buttons Section (Positioned at the bottom)
//           Positioned(
//             bottom: screenHeight * 0.1, // Position buttons dynamically
//             left: screenWidth * 0.12,
//             right: screenWidth * 0.12,
//             child: Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween, // Distribute buttons evenly
//               children: [
//                 _buildButton(context, 'Login', () {
//                   Navigator.pushNamed(context,
//                       RoutesName.signInScreen); // Navigate to login screen
//                 }),
//                 _buildButton(context, 'Get Started', () {
//                   Navigator.pushNamed(context,
//                       RoutesName.sanaSignupScreen); // Navigate to signup screen
//                 }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to create buttons with customized text and event handler
//   Widget _buildButton(
//       BuildContext context, String text, VoidCallback onPressed) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SizedBox(
//       height: screenHeight * 0.05, // Button height 5% of screen height
//       child: ElevatedButton(
//         onPressed: onPressed, // Click event for the button
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white, // Button background color
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10), // Rounded corners
//           ),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: Colors.black, // Text color
//             fontFamily: 'Averia Libre', // Font family for text
//             fontSize: 18, // Font size
//             fontWeight: FontWeight.bold, // Bold text
//           ),
//         ),
//       ),
//     );
//   }
// }