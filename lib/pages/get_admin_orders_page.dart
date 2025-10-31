import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';
import 'update_order_status_page.dart';

class GetAdminOrdersPage extends StatefulWidget {
  const GetAdminOrdersPage({super.key});

  @override
  State<GetAdminOrdersPage> createState() => _GetAdminOrdersPageState();
}

class _GetAdminOrdersPageState extends State<GetAdminOrdersPage> {
  List orders = [];
  bool loading = true;

  Future<void> _fetchAdminOrders() async {
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
      print("Error fetching admin orders: $e");
      setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAdminOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFBF5), Color(0xFFFFF0DC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin Orders",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.black87),
                      onPressed: _fetchAdminOrders,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : orders.isEmpty
                        ? Center(
                            child: Text(
                              "No orders found 😔",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: orders.length,
                            itemBuilder: (context, i) {
                              final order = orders[i];
                              final user = order["User"] ?? {};
                              final items = order["OrderItems"] ?? [];

                              return Container(
                                margin:
                                    const EdgeInsets.only(bottom: 14),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order #${order['Order_ID']}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Chip(
                                          label: Text(
                                            order["Status"] ?? "Unknown",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          backgroundColor:
                                              _getStatusColor(order["Status"]),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "User: ${user["Name"] ?? "N/A"}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      "Email: ${user["mail_ID"] ?? "N/A"}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Total: ₹${order['TotalAmount']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Divider(height: 16),
                                    Text(
                                      "Products:",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    ...items.map<Widget>((item) {
                                      final product =
                                          item["Product"] ?? {};
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(
                                          "- ${product["Product_name"] ?? "Unnamed"} (Qty: ${item["Quantity"] ?? 0})",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const UpdateOrderStatusPage(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.edit),
                                        label: const Text("Update Status"),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Pending":
        return Colors.orangeAccent;
      case "Shipped":
        return Colors.blueAccent;
      case "Delivered":
        return Colors.green;
      case "Cancelled":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
