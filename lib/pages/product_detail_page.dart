import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
                "https://m.media-amazon.com/images/I/71y6XkUHpZL._SL1500_.jpg",
                height: 200),
            const SizedBox(height: 10),
            const Text("Apple Watch Series 4",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("\$1190"),
            const SizedBox(height: 20),
            const Text(
                "The Apple Watch Series 4 boasts a larger display with thinner bezels..."),
            const Spacer(),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                child: const Text("Add to Cart")),
          ],
        ),
      ),
    );
  }
}
