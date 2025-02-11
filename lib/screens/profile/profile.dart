import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/auth/logout.dart';
import 'package:v1_micro_finance/screens/dashboard/referrals_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/help_screen.dart';
import 'package:v1_micro_finance/screens/profile/my_account_screen.dart';
import 'package:v1_micro_finance/screens/profile/nominee_screen.dart';
import 'package:v1_micro_finance/configs/widgets/user_app_bar.dart';

class UserProfile extends StatelessWidget {
  // Placeholder values for profile name and image
  String profileName = "User Name";
  String profileImageUrl =
      "https://via.placeholder.com/150"; // Placeholder profile image URL

  // Function to fetch user ID from API
  Future<String> fetchUserId() async {
    return "12345"; // Replace with actual API call
  }

  // List of buttons with titles, icons, and corresponding screens
  final List<Map<String, dynamic>> buttons = [
    {
      "title": "My Account",
      "icon": Icons.person,
      "screen": UserScreen(),
    },
    {
      "title": "Nominee",
      "icon": Icons.group,
      "screen": NomineeScreen(),
    },
    {
      "title": "Refer & Earn",
      "icon": Icons.people,
      "screen": ReferralsScreen(),
    },
    {
      "title": "Help Center",
      "icon": Icons.help,
      "screen": HelpScreen(),
    },
    {"title": "Logout", "icon": Icons.logout, "screen": Logout()},
  ];

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(
        profileName: profileName,
        profileImageUrl: profileImageUrl,
        fetchUserId: fetchUserId, // Fixed: Ensure fetchUserId is a function
      ),
      body: SafeArea(
        // Ensures the content does not overlap system UI elements like the status bar or notch
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Part 3: Buttons Section
                ...buttons.map((button) {
                  return GestureDetector(
                    // Trigger navigation when button is tapped
                    onTap: () {
                      // Navigate to the respective screen on button tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              button["screen"], // Target screen
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 8), // Space between buttons
                      padding: const EdgeInsets.symmetric(
                          vertical: 10), // Vertical padding for button
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded button corners
                        color:
                            Color(0xFF06426D), // Light gray button background
                      ),
                      child: Row(
                        children: [
                          // Left Section: Icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              button[
                                  'icon'], // Icon dynamically fetched from list
                              size: 30, // Icon size
                              color: Colors.white, // Icon color
                            ),
                          ),

                          // Middle Section: Button Title
                          Expanded(
                            child: Text(
                              button[
                                  'title'], // Title dynamically fetched from list
                              style: TextStyle(
                                fontSize: 18, // Font size for button title
                                fontWeight: FontWeight.bold, // Bold text
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),

                          // Right Section: Arrow Icon
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15), // Padding on the right side
                            child: Icon(
                              Icons
                                  .arrow_forward_ios, // Arrow icon indicating navigation
                              size: 20,
                              color: Colors.white, // Icon size
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }), // Converts list of buttons to widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}
