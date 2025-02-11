import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/loan/about_loan_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/help_screen.dart';
import 'package:v1_micro_finance/screens/loan/loan_reques_screen.dart';
import 'package:v1_micro_finance/screens/loan/loan_status_screen.dart';
import 'package:v1_micro_finance/screens/loan/pay_emi_screen.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class QuickLoanScreen extends StatefulWidget {
  const QuickLoanScreen({super.key});

  @override
  State<QuickLoanScreen> createState() => _QuickLoanScreenState();
}

class _QuickLoanScreenState extends State<QuickLoanScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttons = [
      {
        "icon": Icons.currency_bitcoin,
        "text": "Loan Request",
        "screen": LoanRequestScreen()
      }, //Loan Request
      {
        "icon": Icons.money_sharp,
        "text": "Pay EMI",
        "screen": PayEmiScreen()
      }, //Pay EMI
      {
        "icon": Icons.edit_document,
        "text": "Loan Status",
        "screen": LoanStatusScreen()
      }, //Loan Status
      {
        "icon": Icons.help,
        "text": "Help",
        "screen": HelpScreen()
      }, //Help screen
      {
        "icon": Icons.info,
        "text": "About Loan",
        "screen": AboutloanScreen()
      }, //About Loan
    ];

    // Scaffold widget provides the app's structure
    return Scaffold(
      appBar: const CommonAppBar(title: "Quick Loan"),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height *
                0.05, // 5% vertical padding from top & bottom
          ),
          child: SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% width of screen
            child: GridView.builder(
              shrinkWrap:
                  true, // Ensures the grid only takes the necessary space
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row in the grid
                mainAxisSpacing: 20, // Space between rows
                crossAxisSpacing: 20, // Space between columns
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
