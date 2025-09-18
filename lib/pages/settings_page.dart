import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: ListView(
        children: [
          ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text("My Orders"),
              onTap: () => Navigator.pushNamed(context, '/orderHistory')),
          const ListTile(leading: Icon(Icons.person), title: Text("My Details")),
          const ListTile(
              leading: Icon(Icons.location_on), title: Text("Address Book")),
          const ListTile(
              leading: Icon(Icons.payment), title: Text("Payment Methods")),
          const ListTile(
              leading: Icon(Icons.notifications), title: Text("Notifications")),
          const ListTile(leading: Icon(Icons.help), title: Text("Help Center")),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false)),
        ],
      ),
    );
  }
}
