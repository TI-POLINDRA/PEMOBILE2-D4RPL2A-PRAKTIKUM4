import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Transactions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildTransactionSection("Spending", "\$500"),
            _buildTransactionSection("Income", "\$300"),
            _buildTransactionSection("Bills", "\$500"),
            _buildTransactionSection("Savings", "\$300"),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionSection(String title, String amount) {
    return ListTile(
      leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      trailing: Text(amount, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
