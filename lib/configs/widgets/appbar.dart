// appbar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:v1_micro_finance/configs/viewmodels/user_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);

    return Stack(
      children: [
        const _AppBarBackground(),
        Positioned(
          left: 90,
          right: 20,
          bottom: 25,
          child: Row(
            children: [
              _UserAvatar(imageUrl: vm.user?.imageUrl),
              const SizedBox(width: 12),
              _UserInfo(
                username: vm.user?.username ?? 'Loading...',
                balance: vm.user?.balance.toStringAsFixed(2) ?? '0.00',
                isBalanceVisible: vm.isBalanceVisible,
                onCheckBalance: vm.fetchBalance,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBarBackground extends StatelessWidget {
  const _AppBarBackground();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 45),
        backgroundColor: const Color(0xFF06426D),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String? imageUrl;

  const _UserAvatar({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.07,
      backgroundImage:
          NetworkImage(imageUrl ?? 'https://via.placeholder.com/150'),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String username;
  final String balance;
  final bool isBalanceVisible;
  final VoidCallback onCheckBalance;

  const _UserInfo({
    required this.username,
    required this.balance,
    required this.isBalanceVisible,
    required this.onCheckBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: onCheckBalance,
            child: Bounce(
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFE1E8ED),
                    borderRadius: BorderRadius.circular(15)),
                child: AnimatedCrossFade(
                  firstChild: const Text("Check Balance",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  secondChild: Text(isBalanceVisible ? "\$$balance" : "",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
