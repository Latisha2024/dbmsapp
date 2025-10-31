import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://localhost:5000/api/products"));
  Map? product;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  Future<void> _fetchProduct() async {
    try {
      final response = await _dio.get("/${widget.productId}");
      setState(() {
        product = response.data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (product == null) {
      return const Scaffold(body: Center(child: Text("Product not found")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product!['Product_name'], style: GoogleFonts.poppins()),
        backgroundColor: const Color(0xFF004AAD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product!['Product_name'],
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Text("Price: ₹${product!['Price']}", style: GoogleFonts.poppins(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Discount: ${product!['Discount']}%", style: GoogleFonts.poppins()),
            const SizedBox(height: 10),
            Text("Stock: ${product!['Stock']}", style: GoogleFonts.poppins()),
            const SizedBox(height: 20),
            Text(product!['Description'] ?? "No description",
                style: GoogleFonts.poppins(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}