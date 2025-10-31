// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'auth_services.dart';

// class ViewProductsPage extends StatefulWidget {
//   const ViewProductsPage({super.key});

//   @override
//   State<ViewProductsPage> createState() => _ViewProductsPageState();
// }

// class _ViewProductsPageState extends State<ViewProductsPage> {
//   List products = [];
//   bool loading = true;

//   Future<void> _fetchProducts() async {
//     setState(() => loading = true);
//     try {
//       final token = await AuthService().getToken();
//       final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
//       dio.options.headers['Authorization'] = "Bearer $token";

//       final response = await dio.get("/products");
//       setState(() {
//         products = response.data;
//         loading = false;
//       });
//     } catch (e) {
//       print("Error fetching products: $e");
//       setState(() => loading = false);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("View Products", style: GoogleFonts.poppins(color: Colors.black)),
//         backgroundColor: const Color(0xFFFFF0DC),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: loading
//             ? const Center(child: CircularProgressIndicator())
//             : products.isEmpty
//                 ? Center(
//                     child: Text(
//                       "No products available.",
//                       style: GoogleFonts.poppins(
//                           fontSize: 16, color: Colors.black54),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: products.length,
//                     itemBuilder: (context, i) {
//                       final p = products[i];
//                       return Card(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         elevation: 3,
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 10),
//                           title: Text(
//                             p['Product_name'] ?? 'Unnamed',
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           subtitle: Text(
//                             "₹${p['Price'] ?? 0} | Stock: ${p['Stock'] ?? 0}",
//                             style: GoogleFonts.poppins(
//                                 color: Colors.black54, fontSize: 14),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class ViewProductsPage extends StatefulWidget {
  const ViewProductsPage({super.key});

  @override
  State<ViewProductsPage> createState() => _ViewProductsPageState();
}

class _ViewProductsPageState extends State<ViewProductsPage> {
  List products = [];
  bool loading = true;

  Future<void> _fetchProducts() async {
    setState(() => loading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

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
      appBar: AppBar(
        title: Text("View Products", style: GoogleFonts.poppins(color: Colors.black)),
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
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : products.isEmpty
                ? Center(
                    child: Text(
                      "No products available.",
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: products.length,
                    itemBuilder: (context, i) {
                      final p = products[i];
                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            p['Product_name'] ?? 'Unnamed',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            "₹${p['Price'] ?? 0} | Stock: ${p['Stock'] ?? 0}",
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          trailing: const Icon(Icons.shopping_bag_outlined, color: Colors.black54),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
