import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) => navigationShell.goBranch(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.assignment), label: 'Plan'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet), label: 'Budget'),
          NavigationDestination(icon: Icon(Icons.security), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.handshake), label: 'Permissions'),
        ],
      ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2, curve: Curves.easeOutQuad),
    );
  }
}
