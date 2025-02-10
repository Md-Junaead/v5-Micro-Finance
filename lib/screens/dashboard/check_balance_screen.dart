import 'package:flutter/material.dart';

class CheckBalanceScreen extends StatefulWidget {
  const CheckBalanceScreen({super.key});

  @override
  _CheckBalanceScreenState createState() => _CheckBalanceScreenState();
}

class _CheckBalanceScreenState extends State<CheckBalanceScreen> {
  // Placeholder for balance data, this will be replaced with actual API data
  String depositBalance = "Loading...";
  String profitBalance = "Loading...";
  String referralBalance = "Loading...";
  String withdrawalBalance = "Loading...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).size.height * 0.03),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30, // Customize icon color
          ),
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.03), // Moves text 5% down
            child: const Text("Balance"),
          ),
          backgroundColor: Color(0xFF06426D),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // 8% top & bottom space
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Part 2: Balance Buttons
              Column(
                children: [
                  _buildBalanceButton('Deposit Balance', depositBalance),
                  _buildBalanceButton('Profit Balance', profitBalance),
                  _buildBalanceButton('Referral Balance', referralBalance),
                  _buildBalanceButton('Withdrawal Balance', withdrawalBalance),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a balance button
  Widget _buildBalanceButton(String title, String balance) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.7, // 8% margin from left & right
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: Color(0xFF06426D),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 0),
            // padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 19, // Set font size to 21px
                  color: Colors.white, // Set text color to white
                  fontWeight: FontWeight.bold), // Set text to bold
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  balance,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight:
                          FontWeight.bold), // Set balance font size to 15px
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fetch data from API (mock implementation)
  Future<void> fetchBalanceData() async {
    // Replace the following lines with your actual API call
    setState(() {
      depositBalance = "1000"; // Example data, replace with API response
      profitBalance = "500";
      referralBalance = "200";
      withdrawalBalance = "1500";
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBalanceData(); // Fetch data when the screen loads
  }
}
