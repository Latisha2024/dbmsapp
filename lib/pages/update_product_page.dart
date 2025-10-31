import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final stockController = TextEditingController();
  final imageUrlController = TextEditingController();
  final descController = TextEditingController();

  bool isLoading = false;
  bool productFetched = false;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
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
  }

  Future<void> _fetchProduct() async {
    if (idController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter Product ID")),
      );
      return;
    }
    setState(() => isLoading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

      final res = await dio.get("/products/${idController.text}");
      final p = res.data;

      nameController.text = p['Product_name'] ?? '';
      priceController.text = p['Price'].toString();
      discountController.text = p['Discount'].toString();
      stockController.text = p['Stock'].toString();
      imageUrlController.text = p['Image_URL'] ?? '';
      descController.text = p['Description'] ?? '';

      setState(() {
        productFetched = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Product not found: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _updateProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

      final response = await dio.put(
        "/products/update/${idController.text}",
        data: {
          "Product_name": nameController.text,
          "Price": priceController.text,
          "Discount": discountController.text,
          "Stock": stockController.text,
          "Image_URL": imageUrlController.text,
          "Description": descController.text,
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ ${response.data['message']}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error updating: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Update Product", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color(0xFFFFF0DC),
        elevation: 0,
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
        child: ListView(
          children: [
            TextField(
              controller: idController,
              decoration: _inputDecoration("Enter Product ID"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: isLoading ? null : _fetchProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text("Fetch Product",
                      style: GoogleFonts.poppins(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            if (productFetched)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration("Product Name"),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: priceController,
                      decoration: _inputDecoration("Price"),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: discountController,
                      decoration: _inputDecoration("Discount (%)"),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: stockController,
                      decoration: _inputDecoration("Stock Quantity"),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: imageUrlController,
                      decoration: _inputDecoration("Image URL"),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: descController,
                      decoration: _inputDecoration("Description"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isLoading ? null : _updateProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Update Product",
                              style: GoogleFonts.poppins(color: Colors.white)),
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
