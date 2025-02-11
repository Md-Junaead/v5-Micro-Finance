import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/withdraw/deposite/deposit_bank.dart';
import 'package:v1_micro_finance/screens/withdraw/deposite/deposit_crypto.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class DepositGateway extends StatefulWidget {
  const DepositGateway({super.key});

  @override
  _DepositGatewayState createState() => _DepositGatewayState();
}

class _DepositGatewayState extends State<DepositGateway> {
  // Placeholder for balance data, this will be replaced with actual API data
  String withdrawalBalance = "Loading...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Deposite Gateway"),
      body: Column(
        children: [
          // Part One: Withdrawal Balance at the top
          Container(
            margin: EdgeInsets.only(
                top:
                    MediaQuery.of(context).size.height * 0.2), // 20% top margin
            width: MediaQuery.of(context).size.width *
                0.84, // 8% margin from left and right
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.credit_card, color: Colors.amber),
                SizedBox(width: 10),
                Text("Withdraw Balance",
                    style: TextStyle(
                        color: Color(0xFF06426D),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Spacer to create a gap between sections
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.08), // 20% gap below Part One

          // Part Two: Withdrawal Balance display
          Center(
            child:
                _buildBalanceButton('Withdrawable Balance', withdrawalBalance),
          ),

          const SizedBox(height: 20), // Gap between balance and action buttons

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
                    targetScreen: DepositBank(),
                  ),

                  // Crypto Button
                  _buildActionButton(
                    context,
                    icon: Icons.currency_bitcoin,
                    label: 'Crypto',
                    color: Color(0xFF06426D),
                    targetScreen: DepositCrypto(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create a balance button
  Widget _buildBalanceButton(String title, String balance) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.84, // 8% margin from left and right
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: Color(0xFF06426D),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 0),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 19, // Font size for title
                  color: Colors.white, // White text color
                  fontWeight: FontWeight.bold), // Bold text
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.attach_money,
                  color: Color.fromARGB(255, 255, 212, 18), // Yellow color
                  size: 35, // Icon size
                ),
                const SizedBox(width: 5),
                Text(
                  balance,
                  style: const TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 25, // Font size for balance
                      fontWeight: FontWeight.bold), // Bold text
                ),
              ],
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

  // Fetch data from API (mock implementation)
  Future<void> fetchBalanceData() async {
    // Replace the following lines with your actual API call
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    setState(() {
      withdrawalBalance = "1500"; // Set the balance
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBalanceData(); // Fetch data when the screen loads
  }
}
