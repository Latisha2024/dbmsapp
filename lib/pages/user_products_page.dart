import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class GetUserProductsPage extends StatefulWidget {
  const GetUserProductsPage({super.key});

  @override
  State<GetUserProductsPage> createState() => _GetUserProductsPageState();
}

class _GetUserProductsPageState extends State<GetUserProductsPage> {
  List products = [];
  bool loading = true;

  Future<void> _fetchProducts() async {
    setState(() => loading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get("/products");
      setState(() {
        products = response.data;
        loading = false;
      });
    } catch (e) {
      print("Error fetching products: $e");
      setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text("No products available"))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, i) {
                    final p = products[i];
                    return ListTile(
                      title: Text(p["Product_name"]),
                      subtitle: Text("Price: ₹${p["Price"]}"),
                    );
                  },
                ),
    );
  }
}
