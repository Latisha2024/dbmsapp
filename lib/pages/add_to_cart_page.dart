import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  final _formKey = GlobalKey<FormState>();
  final productIdController = TextEditingController();
  final quantityController = TextEditingController();
  bool isLoading = false;

  Future<void> _addToCart() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    try {
      final token = await AuthService().getToken();
      if (token == null) throw Exception("User not logged in");

      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.post("/cart/add", data: {
        "Product_ID": int.parse(productIdController.text),
        "Quantity": int.parse(quantityController.text),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ ${response.data['message']}")),
      );
      _formKey.currentState!.reset();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Error: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Add to Cart", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color(0xFFFFF0DC),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: productIdController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Product ID"),
                validator: (v) => v!.isEmpty ? "Enter Product ID" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Quantity"),
                validator: (v) => v!.isEmpty ? "Enter Quantity" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : _addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text("Add to Cart",
                        style: GoogleFonts.poppins(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
