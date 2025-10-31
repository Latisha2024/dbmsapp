// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'auth_services.dart';

// class UpdateOrderStatusPage extends StatefulWidget {
//   const UpdateOrderStatusPage({super.key});

//   @override
//   State<UpdateOrderStatusPage> createState() => _UpdateOrderStatusPageState();
// }

// class _UpdateOrderStatusPageState extends State<UpdateOrderStatusPage> {
//   List orders = [];
//   bool loading = true;
//   String? selectedOrderId;
//   String? selectedStatus;

//   final List<String> statuses = [
//     "Pending",
//     "Shipped",
//     "Delivered",
//     "Cancelled"
//   ];

//   Future<void> _fetchOrders() async {
//     setState(() => loading = true);
//     try {
//       final token = await AuthService().getToken();
//       final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
//       dio.options.headers["Authorization"] = "Bearer $token";

//       final response = await dio.get("/orders/admin");
//       setState(() {
//         orders = response.data;
//         loading = false;
//       });
//     } catch (e) {
//       print("Error fetching orders: $e");
//       setState(() => loading = false);
//     }
//   }

//   Future<void> _updateStatus() async {
//     if (selectedOrderId == null || selectedStatus == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("⚠️ Please select order and status")),
//       );
//       return;
//     }

//     try {
//       final token = await AuthService().getToken();
//       final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
//       dio.options.headers["Authorization"] = "Bearer $token";

//       final response = await dio.put(
//         "/orders/$selectedOrderId/status",
//         data: {"Status": selectedStatus},
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("✅ ${response.data['message']}")),
//       );

//       _fetchOrders(); // refresh
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("❌ Error updating: $e")),
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
//         title: Text("Update Order Status", style: GoogleFonts.poppins()),
//         centerTitle: true,
//       ),
//       body: loading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: "Select Order",
//                       border: OutlineInputBorder(),
//                     ),
//                     value: selectedOrderId,
//                     items: orders.map<DropdownMenuItem<String>>((order) {
//                       return DropdownMenuItem<String>(
//                         value: order["Order_ID"].toString(),
//                         child: Text(
//                           "Order #${order['Order_ID']} - ${order['Status']}",
//                           style: GoogleFonts.poppins(),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedOrderId = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: "Select New Status",
//                       border: OutlineInputBorder(),
//                     ),
//                     value: selectedStatus,
//                     items: statuses.map((status) {
//                       return DropdownMenuItem<String>(
//                         value: status,
//                         child: Text(status, style: GoogleFonts.poppins()),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedStatus = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton.icon(
//                     onPressed: _updateStatus,
//                     icon: const Icon(Icons.update),
//                     label: Text(
//                       "Update Status",
//                       style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class UpdateOrderStatusPage extends StatefulWidget {
  const UpdateOrderStatusPage({super.key});

  @override
  State<UpdateOrderStatusPage> createState() => _UpdateOrderStatusPageState();
}

class _UpdateOrderStatusPageState extends State<UpdateOrderStatusPage> {
  List orders = [];
  bool loading = true;
  String? selectedOrderId;
  String? selectedStatus;

  final List<String> statuses = ["Pending", "Shipped", "Delivered", "Cancelled"];

  Future<void> _fetchOrders() async {
    setState(() => loading = true);
    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get("/orders/admin");
      setState(() {
        orders = response.data;
        loading = false;
      });
    } catch (e) {
      print("Error fetching orders: $e");
      setState(() => loading = false);
    }
  }

  Future<void> _updateStatus() async {
    if (selectedOrderId == null || selectedStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Please select order and status")),
      );
      return;
    }

    try {
      final token = await AuthService().getToken();
      final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api"));
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.put(
        "/orders/$selectedOrderId/status",
        data: {"Status": selectedStatus},
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ ${response.data['message']}")),
      );

      _fetchOrders(); // refresh
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error updating: $e")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Update Order Status", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: const Color(0xFFFFF0DC),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
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
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Select Order"),
                    value: selectedOrderId,
                    items: orders.map<DropdownMenuItem<String>>((order) {
                      return DropdownMenuItem<String>(
                        value: order["Order_ID"].toString(),
                        child: Text(
                          "Order #${order['Order_ID']} - ${order['Status']}",
                          style: GoogleFonts.poppins(),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOrderId = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration("Select New Status"),
                    value: selectedStatus,
                    items: statuses.map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status, style: GoogleFonts.poppins()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _updateStatus,
                      icon: const Icon(Icons.update, color: Colors.white),
                      label: Text(
                        "Update Status",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
