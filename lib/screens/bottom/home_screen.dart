import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/dashboard/check_balance_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/deposit_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/packages_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/policies.dart';
import 'package:v1_micro_finance/screens/dashboard/quick_loan_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/referrals_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/help_screen.dart';
import 'package:v1_micro_finance/widgets/app_drawer.dart';
import 'package:v1_micro_finance/widgets/appbar.dart';

void main() {
  runApp(const MicroFinance());
}

class MicroFinance extends StatelessWidget {
  const MicroFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Placeholder values for profile name, image, and balance
  String profileName = "User Name";
  String profileImageUrl =
      "https://via.placeholder.com/150"; // Placeholder profile image URL
  bool isBalanceVisible = false; // Flag to toggle balance visibility
  String balanceAmount = "\$1000"; // Placeholder balance value

  // Function to toggle balance visibility
  void toggleBalance() {
    setState(() {
      isBalanceVisible = !isBalanceVisible; // Toggle the visibility state
    });
  }

  // Demo API call to simulate fetching balance
  Future<String> fetchBalance() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    return "\$1500"; // Return a dummy balance after the delay
  }

  @override
  Widget build(BuildContext context) {
    // List of buttons with icon, text, and the screen it navigates to
    final List<Map<String, dynamic>> buttons = [
      {
        "icon": Icons.add,
        "text": "Make your first deposit",
        "screen": DepositScreen()
      }, //DepositScreen

      // {
      //   "icon": Icons.money_off,
      //   "text": "Withdraw",
      //   "screen": WithDrawType()
      // }, //WithdrawScreen
      {
        "icon": Icons.paid_outlined,
        "text": "Profit Balance",
        "screen": CheckBalanceScreen()
      },
      {
        "icon": Icons.real_estate_agent,
        "text": "Quick Loan",
        "screen": QuickLoanScreen()
      }, //QuickLoanScreen
      {
        "icon": Icons.people,
        "text": "Referrals",
        "screen": ReferralsScreen()
      }, //ReferralsScreen
      {
        "icon": Icons.card_giftcard,
        "text": "Saving Plan",
        "screen": PackagesScreen()
      }, //Saving Plan

      {
        "icon": Icons.contact_support,
        "text": "help",
        "screen": HelpScreen()
      }, //HelpScreen
      {
        "icon": Icons.policy_outlined,
        "text": "Policies",
        "screen": Policies()
      }, //Policies

      {
        "icon": Icons.play_circle,
        "text": "Watch Now",
        "screen": Policies()
      }, //Play Now
    ];

    // Scaffold widget provides the app's structure
    return Scaffold(
      // Custom AppBar with necessary profile data
      appBar: CustomAppBar(
        profileName: profileName, // Profile name to be displayed
        profileImageUrl: profileImageUrl, // Profile image URL to be used
        fetchBalance: fetchBalance, // API method to fetch balance
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height *
                0.01, // 5% vertical padding from top & bottom
          ),
          child: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% width of screen
            child: GridView.builder(
              shrinkWrap:
                  true, // Ensures the grid only takes the necessary space
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row in the grid
                mainAxisSpacing: 5, // Space between rows
                crossAxisSpacing: 5, // Space between columns
                childAspectRatio: 1, // Equal width and height for grid items
              ),
              itemCount: buttons.length, // Total number of buttons in the grid
              itemBuilder: (context, index) {
                final button = buttons[index]; // Get each button data
                return GestureDetector(
                  // On tap, navigate to the respective screen
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => button["screen"], // Navigate
                      ),
                    );
                  },
                  child: Container(
                    // Styling the button container
                    decoration: BoxDecoration(
                      color: Color(0xFFFEF7FF), // Button color
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content
                      children: [
                        Icon(
                          button["icon"], // Icon of the button
                          size: 50, // Icon size
                          color: Color(0xFF06426D), // Icon color
                        ),
                        const SizedBox(
                            height: 10), // Space between icon and text
                        Text(
                          button["text"], // Text to display under icon
                          style: const TextStyle(
                            color: Color(0xFF06426D), // Text color
                            fontSize: 16, // Font size of the text
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
