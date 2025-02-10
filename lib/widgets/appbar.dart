import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

/// A reusable AppBar widget with profile details and balance checking functionality.
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String profileName;
  final String profileImageUrl;
  final Future<String> Function() fetchBalance;

  const CustomAppBar({
    super.key,
    required this.profileName,
    required this.profileImageUrl,
    required this.fetchBalance,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 50); // Increased height
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isBalanceVisible = false;
  String balanceAmount = '';
  Timer? _timer;

  /// Fetches balance from API and displays it for a limited time.
  void onCheckBalance() async {
    String balance = await widget.fetchBalance();
    setState(() {
      balanceAmount = balance;
      isBalanceVisible = true;
    });

    _timer = Timer(const Duration(seconds: 8), () {
      setState(() {
        isBalanceVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = MediaQuery.of(context).size.height * 0.03;

    return Stack(
      clipBehavior: Clip.none, // Ensures profile section is not clipped
      children: [
        /// Background AppBar
        PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + topPadding),
          child: AppBar(
            clipBehavior: Clip.none,
            iconTheme: const IconThemeData(
                color: Colors.white, size: 45), // Increased Drawer Icon Size
            backgroundColor: const Color(0xFF06426D),
            centerTitle: true,
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 10.0), // Move icon 20px down, 10px right
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
        ),

        /// Profile Section (Brought to the Front)
        Positioned(
          left: 90, // Adjusts position from left
          right: 20, // Adjusts position from right
          bottom: 25, // Brings it outside AppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Profile Image with Border Shadow
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: screenWidth * 0.07,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
              ),

              const SizedBox(width: 12), // Space between image and name

              /// Profile Name and Balance Checker
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// User Name
                    Text(
                      widget.profileName,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),

                    /// Balance Button with Animation
                    GestureDetector(
                      onTap: onCheckBalance,
                      child: Bounce(
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenWidth * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE1E8ED),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: AnimatedCrossFade(
                            firstChild: Text(
                              "Check Balance",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            secondChild: Text(
                              isBalanceVisible ? balanceAmount : "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            crossFadeState: isBalanceVisible
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 200),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
