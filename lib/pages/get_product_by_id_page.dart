// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'auth_services.dart';

// class GetProductByIdPage extends StatefulWidget {
//   const GetProductByIdPage({super.key});

//   @override
//   State<GetProductByIdPage> createState() => _GetProductByIdPageState();
// }

// class _GetProductByIdPageState extends State<GetProductByIdPage> {
//   final _controller = TextEditingController();
//   Map? product;
//   bool loading = false;

//   Future<void> _getProduct() async {
//     setState(() => loading = true);
//     try {
//       final token = await AuthService().getToken();
//       final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
//       dio.options.headers["Authorization"] = "Bearer $token";

//       final response = await dio.get("/products/${_controller.text}");
//       setState(() => product = response.data);
//     } catch (e) {
//       print("Error fetching product: $e");
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product not found")));
//     } finally {
//       setState(() => loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Get Product by ID")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(controller: _controller, decoration: const InputDecoration(labelText: "Enter Product ID")),
//             const SizedBox(height: 10),
//             ElevatedButton(onPressed: _getProduct, child: const Text("Fetch Product")),
//             const SizedBox(height: 20),
//             if (loading) const CircularProgressIndicator(),
//             if (product != null) Text("Product: ${product!["Product_name"]}\nPrice: ₹${product!["Price"]}"),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class GetProductByIdPage extends StatefulWidget {
  const GetProductByIdPage({super.key});

  @override
  State<GetProductByIdPage> createState() => _GetProductByIdPageState();
}

class _GetProductByIdPageState extends State<GetProductByIdPage> {
  final _controller = TextEditingController();
  Map? product;
  bool loading = false;

  Future<void> _getProduct() async {
    setState(() => loading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get("/products/${_controller.text}");
      setState(() => product = response.data);
    } catch (e) {
      print("Error fetching product: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Product not found")));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Product by ID", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color(0xFFFFF0DC),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Enter Product ID",
                  labelStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _getProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEAA5E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text("Fetch Product", style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 30),
              if (loading)
                const CircularProgressIndicator()
              else if (product != null)
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Details",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        Text("🆔 ID: ${product!["Product_ID"]}",
                            style: GoogleFonts.poppins(fontSize: 14)),
                        Text("📦 Name: ${product!["Product_name"]}",
                            style: GoogleFonts.poppins(fontSize: 14)),
                        Text("💰 Price: ₹${product!["Price"]}",
                            style: GoogleFonts.poppins(fontSize: 14)),
                        Text("📉 Stock: ${product!["Stock"]}",
                            style: GoogleFonts.poppins(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
