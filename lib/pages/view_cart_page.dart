import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class ViewCartPage extends StatefulWidget {
  const ViewCartPage({super.key});

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  final _auth = AuthService();
  List<dynamic> cartItems = [];
  bool isLoading = true;

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
      setState(() {
        cartItems = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Failed to load cart: $e")));
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
        title: Text("My Cart", style: GoogleFonts.poppins(color: Colors.black)),
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
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      final product = item['Product'];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: product['Image_URL'] != null
                              ? Image.network(product['Image_URL'],
                                  width: 60, fit: BoxFit.cover)
                              : const Icon(Icons.image_not_supported),
                          title: Text(product['Product_name'] ?? "No Name",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            "Qty: ${item['Quantity']} | ₹${product['Price']}",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
