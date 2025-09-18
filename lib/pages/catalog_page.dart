import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catalog")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search essentials, groceries and more...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Image.network(
                  "https://m.media-amazon.com/images/I/71o8Q5XJS5L._SL1500_.jpg"),
              title: const Text("Galaxy M13 4GB | 64GB"),
              subtitle: const Text("₹10,999  (Save ₹4500)"),
              trailing: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/productDetail'),
                child: const Text("View"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
