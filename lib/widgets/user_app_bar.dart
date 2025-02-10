import 'dart:async';
import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

class UserAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String profileName;
  final String profileImageUrl;
  final Future<String> Function() fetchUserId; // API call to fetch user ID

  const UserAppBar({
    super.key,
    required this.profileName,
    required this.profileImageUrl,
    required this.fetchUserId,
  });

  @override
  _UserAppBarState createState() => _UserAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _UserAppBarState extends State<UserAppBar> {
  String userId = ''; // Variable to hold the fetched User ID

  // Function to fetch User ID from API
  void fetchUserId() async {
    String id = await widget.fetchUserId(); // Fetch user ID from API
    setState(() {
      userId = id; // Update state with fetched user ID
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserId(); // Fetch user ID when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Padding(
      padding: const EdgeInsets.only(bottom: 0.01),
      child: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF06426D), // AppBar background color
        elevation: 0, // Remove AppBar shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space elements
          children: [
            // Profile Picture Section
            CircleAvatar(
              radius: screenWidth * 0.07, // Responsive image size
              backgroundImage:
                  NetworkImage(widget.profileImageUrl), // Load image from API
            ),

            const SizedBox(width: 10), // Space between avatar and text

            // Profile Name & User ID Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Minimize column height
                children: [
                  Text(
                    widget.profileName, // Display profile name
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                  const SizedBox(height: 5), // Space between name and user ID
                  Text(
                    userId.isNotEmpty
                        ? "User ID: $userId"
                        : "Fetching...", // Display User ID
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ],
              ),
            ),

            // Edit Button Section
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,
                    RoutesName.editProfileScreen); // Navigate to edit profile
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03, // Responsive padding
                  vertical: screenWidth * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(15), // Border radius
                ),
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Color(0xFF06426D), // Text color
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
