import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order History")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Order #134736"),
              subtitle: Text("Ordered: 15/07/2025 - Total: \$199"),
              trailing: Text("Cancelled"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Order #167388"),
              subtitle: Text("Ordered: 03/11/2024 - Total: \$619.98"),
              trailing: Text("Delivered"),
            ),
          ),
        ],
      ),
    );
  }
}
