import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/withdraw/profit/profit_bank.dart';
import 'package:v1_micro_finance/screens/withdraw/profit/profit_crypto.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class ProfitGateway extends StatefulWidget {
  const ProfitGateway({super.key});

  @override
  _ProfitGatewayState createState() => _ProfitGatewayState();
}

class _ProfitGatewayState extends State<ProfitGateway> {
  // Placeholder for balance data, this will be replaced with actual API data
  String withdrawalBalance = "Loading...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Profit GateWay"),
      body: Column(
        children: [
          // Spacer to create a gap between sections
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.08), // 20% gap below Part One

          // Part Two: Withdrawal Balance display
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Text(
                'You can withdraw your loan through two methods.\n Choose any',
                textAlign: TextAlign.center, // Align text to center
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06426D)),
              ),
            ),
          ),

          // Spacer to create a gap between sections
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.08), // 20% gap below Part One// Gap between balance and action buttons

          // Part Three: Action Buttons (Bank and Crypto)
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.84, // 8% margin from left and right
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Space between buttons
                children: [
                  // Bank Button
                  _buildActionButton(
                    context,
                    icon: Icons.account_balance,
                    label: 'Bank',
                    color: Color(0xFF06426D),
                    targetScreen: ProfitBank(),
                  ),

                  // Crypto Button
                  _buildActionButton(
                    context,
                    icon: Icons.currency_bitcoin,
                    label: 'Crypto',
                    color: Color(0xFF06426D),
                    targetScreen: ProfitCrypto(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create action buttons (Bank and Crypto)
  Widget _buildActionButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required Widget targetScreen}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to the respective screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        child: Container(
          height: 100, // Set a fixed height for buttons
          margin: const EdgeInsets.symmetric(horizontal: 5), // Adjust margin
          decoration: BoxDecoration(
            color: color, // Button color
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white), // Icon for the button
              const SizedBox(height: 10), // Gap between icon and label
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white, // Label color
                  fontSize: 16, // Label font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
