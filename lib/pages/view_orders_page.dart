// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'auth_services.dart';

// class ViewOrdersPage extends StatefulWidget {
//   const ViewOrdersPage({super.key});

//   @override
//   State<ViewOrdersPage> createState() => _ViewOrdersPageState();
// }

// class _ViewOrdersPageState extends State<ViewOrdersPage> {
//   final _auth = AuthService();
//   List<dynamic> orders = [];
//   bool isLoading = true;

//   Future<void> _fetchOrders() async {
//     try {
//       final token = await _auth.getToken();
//       final user = await _auth.getUser();
//       if (token == null || user == null) {
//         throw Exception("User not logged in");
//       }

//       final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
//       dio.options.headers['Authorization'] = "Bearer $token";

//       final response = await dio.get("/orders/${user['id']}");
//       setState(() {
//         orders = response.data;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() => isLoading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("❌ Failed to load orders: $e")),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchOrders();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             Text("My Orders", style: GoogleFonts.poppins(color: Colors.black)),
//         backgroundColor: const Color(0xFFFFF0DC),
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : orders.isEmpty
//                 ? Center(
//                     child: Text(
//                       "📦 You have no orders yet",
//                       style: GoogleFonts.poppins(fontSize: 16),
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(12),
//                     itemCount: orders.length,
//                     itemBuilder: (context, index) {
//                       final order = orders[index];
//                       final items = order['OrderItems'] ?? [];
//                       final totalItems = items.length;
//                       final status = order['Status'] ?? "Unknown";

//                       return Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                         child: ExpansionTile(
//                           title: Text(
//                             "Order #${order['Order_ID'] ?? 'N/A'}",
//                             style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           subtitle: Text(
//                             "Status: $status  |  $totalItems item(s)",
//                             style: GoogleFonts.poppins(fontSize: 13),
//                           ),
//                           children: items.isEmpty
//                               ? [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "No items found",
//                                       style: GoogleFonts.poppins(
//                                           color: Colors.grey),
//                                     ),
//                                   )
//                                 ]
//                               : items.map<Widget>((item) {
//                                   final product = item['Product'] ?? {};
//                                   return ListTile(
//                                     leading: product['Image_URL'] != null
//                                         ? Image.network(
//                                             product['Image_URL'],
//                                             width: 55,
//                                             height: 55,
//                                             fit: BoxFit.cover,
//                                           )
//                                         : const Icon(Icons.image_not_supported),
//                                     title: Text(
//                                       product['Product_name'] ?? "Unnamed Product",
//                                       style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     subtitle: Text(
//                                       "Qty: ${item['Quantity']} | ₹${product['Price'] ?? 0}",
//                                       style: GoogleFonts.poppins(fontSize: 13),
//                                     ),
//                                   );
//                                 }).toList(),
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

class ViewOrdersPage extends StatefulWidget {
  const ViewOrdersPage({super.key});

  @override
  State<ViewOrdersPage> createState() => _ViewOrdersPageState();
}

class _ViewOrdersPageState extends State<ViewOrdersPage> {
  final _auth = AuthService();
  List<dynamic> orders = [];
  bool isLoading = true;

  Future<void> _fetchOrders() async {
    try {
      final token = await _auth.getToken();
      final user = await _auth.getUser();
      if (token == null || user == null) {
        throw Exception("User not logged in");
      }

      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers['Authorization'] = "Bearer $token";

      final response = await dio.get("/orders/${user['id']}");
      setState(() {
        orders = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed to load orders: $e")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("My Orders", style: GoogleFonts.poppins(color: Colors.black)),
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
            : orders.isEmpty
                ? Center(
                    child: Text(
                      "📦 You have no orders yet",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      final items = order['OrderItems'] ?? [];
                      final totalItems = items.length;
                      final status = order['Status'] ?? "Unknown";

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ExpansionTile(
                          title: Text(
                            "Order #${order['Order_ID'] ?? 'N/A'}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "Status: $status  |  $totalItems item(s)",
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                          children: items.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No items found",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey),
                                    ),
                                  )
                                ]
                              : items.map<Widget>((item) {
                                  final product = item['Product'] ?? {};
                                  return ListTile(
                                    leading: product['Image_URL'] != null
                                        ? Image.network(
                                            product['Image_URL'],
                                            width: 55,
                                            height: 55,
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(Icons.image_not_supported),
                                    title: Text(
                                      product['Product_name'] ?? "Unnamed Product",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      "Qty: ${item['Quantity']} | ₹${product['Price'] ?? 0}",
                                      style: GoogleFonts.poppins(fontSize: 13),
                                    ),
                                  );
                                }).toList(),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}

