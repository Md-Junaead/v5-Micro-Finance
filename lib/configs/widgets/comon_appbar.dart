import 'package:flutter/material.dart';

/// A common AppBar widget that can be used across multiple screens.
/// The title is dynamic and can be passed as a parameter.
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Dynamic title

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
          kToolbarHeight + MediaQuery.of(context).size.height * 0.03),
      child: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Customize icon color
          size: 30,
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(
              top:
                  MediaQuery.of(context).size.height * 0.02), // Moves text down
          child: Text(title), // Dynamic title
        ),
        backgroundColor: const Color(0xFF06426D),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + 20); // Adjusted height (similar to dynamic height)
}
//appBar: const CommonAppBar(title: "Deposite Screen"),
