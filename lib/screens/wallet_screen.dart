import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/transaction_item.dart';
import '../widgets/bottom_navbar.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Header(),
          TransactionItem(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
