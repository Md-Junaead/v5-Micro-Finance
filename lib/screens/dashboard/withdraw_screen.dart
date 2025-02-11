import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/withdraw/deposite/deposit_gateway.dart';
import 'package:v1_micro_finance/screens/withdraw/profit/profit_gateway.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

// Verification Screen

class WithDrawType extends StatefulWidget {
  const WithDrawType({super.key});

  @override
  State<WithDrawType> createState() => _WithDrawTypeState();
}

class _WithDrawTypeState extends State<WithDrawType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Withdraw Type"),
      body: Container(
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Distribute icons evenly
          children: [
            InkWell(
              onTap: () {
                // Handle profit withdraw action (likely navigation to LoanWithdrawScreen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfitGateway(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center text and icon
                children: [
                  Icon(Icons.arrow_upward,
                      color: Colors.blue), // Profit withdraw icon
                  const Text(
                    'Profit Withdraw',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Handle deposit withdraw action (likely navigation to DepositWithdrawScreen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DepositGateway(), // Assume this screen exists
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_downward,
                      color: Colors.blue), // Deposit withdraw icon
                  const Text(
                    'Deposit Withdraw',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
