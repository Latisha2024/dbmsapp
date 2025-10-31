import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final _auth = AuthService();
  List<dynamic> cartItems = [];
  bool isLoading = true;
  double totalAmount = 0.0;

  Future<void> _fetchCart() async {
    try {
      final token = await _auth.getToken();
      final user = await _auth.getUser();
      if (token == null || user == null) {
        throw Exception("User not logged in");
      }

      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

      final response = await dio.get("/cart/${user['id']}");
      final List<dynamic> items = response.data;

      // Calculate total
      double sum = 0;
      for (var item in items) {
        final product = item['Product'];
        final price = (product['Price'] is String)
            ? double.tryParse(product['Price']) ?? 0.0
            : product['Price']?.toDouble() ?? 0.0;
        final qty = (item['Quantity'] is String)
            ? int.tryParse(item['Quantity']) ?? 0
            : item['Quantity'] ?? 0;
        sum += price * qty;
      }

      setState(() {
        cartItems = items;
        totalAmount = sum;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Failed to load cart: $e")));
    }
  }

  Future<void> _placeOrder() async {
    try {
      final token = await _auth.getToken();
      final user = await _auth.getUser();
      if (token == null || user == null) {
        throw Exception("User not logged in");
      }

      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

      final response = await dio.post("/orders/${user['id']}");
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Order placed successfully!")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Failed to place order: $e")));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Place Order", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color(0xFFFFF0DC),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : cartItems.isEmpty
                ? Center(
                    child: Text("🛒 Your cart is empty",
                        style: GoogleFonts.poppins(fontSize: 16)),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            final product = item['Product'];
                            final qty = item['Quantity'];
                            final price = product['Price'];

                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: product['Image_URL'] != null
                                    ? Image.network(product['Image_URL'],
                                        width: 60, fit: BoxFit.cover)
                                    : const Icon(Icons.image_not_supported),
                                title: Text(
                                  product['Product_name'] ?? "No Name",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  "Qty: $qty | ₹$price",
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total:",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                Text("₹${totalAmount.toStringAsFixed(2)}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              onPressed: _placeOrder,
                              child: Text("Place Order",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
