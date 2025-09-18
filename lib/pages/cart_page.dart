import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Delivery Address:\n201, 6th street, Delhi",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("Casual T-shirt"),
                    trailing: Text("\$24.99 x2"),
                  ),
                  ListTile(
                    title: Text("Smartphone"),
                    trailing: Text("\$499 x1"),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Text("Subtotal: \$600.48"),
            const Text("Delivery Fee: \$20.00"),
            const Text("Platform Fee: \$3.50"),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {}, child: const Text("Place Order")),
          ],
        ),
      ),
    );
  }
}
