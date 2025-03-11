import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/screens/signin/auth_view_model.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the user data from AuthViewModel
    final user = Provider.of<AuthViewModel>(context).user;

    // If user data is not available, show a loading indicator
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying all user information here
                    Text("Name: ${user.name}", style: TextStyle(fontSize: 18)),
                    Text("Email: ${user.email}",
                        style: TextStyle(fontSize: 18)),
                    Text("Username: ${user.username}",
                        style: TextStyle(fontSize: 18)),
                    Text("Phone: ${user.phoneNo ?? 'N/A'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Address: ${user.address ?? 'N/A'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Country: ${user.country}",
                        style: TextStyle(fontSize: 18)),
                    Text("Date of Birth: ${user.dob ?? 'N/A'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Referral Code: ${user.referralCode}",
                        style: TextStyle(fontSize: 18)),
                    Text("NID Number: ${user.nidnumber ?? 'N/A'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Passport: ${user.passport ?? 'N/A'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Role: ${user.role}", style: TextStyle(fontSize: 18)),
                    Text("Account Active: ${user.active ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Enabled: ${user.enabled ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),
                    Text("Account Locked: ${user.lock ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),
                    Text(
                        "Account Non-Locked: ${user.accountNonLocked ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),
                    Text(
                        "Account Non-Expired: ${user.accountNonExpired ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),
                    Text(
                        "Credentials Non-Expired: ${user.credentialsNonExpired ? 'Yes' : 'No'}",
                        style: TextStyle(fontSize: 18)),

                    // Displaying Authorities list
                    SizedBox(height: 20),
                    Text("Authorities:", style: TextStyle(fontSize: 18)),
                    ...user.authorities.map(
                      (authority) => Text(" - ${authority.authority}",
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
