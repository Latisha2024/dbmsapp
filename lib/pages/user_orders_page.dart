import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'auth_services.dart';

class UserOrdersPage extends StatefulWidget {
  const UserOrdersPage({super.key});

  @override
  State<UserOrdersPage> createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage> {
  bool isLoading = true;
  List<dynamic> orders = [];

  Future<void> _fetchOrders() async {
    try {
      final user = await AuthService().getUser();
      final userId = user?['id'];
      final token = await AuthService().getToken();

      if (userId == null || token == null) throw Exception("User not found");

      final dio = AuthService().dio;
      dio.options.headers["Authorization"] = "Bearer $token";

      final response = await dio.get("/orders/$userId");

      setState(() {
        orders = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ Error: $e")));
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
            ? const Center(child: CircularProgressIndicator(color: Colors.black))
            : orders.isEmpty
                ? Center(
                    child: Text("No orders found",
                        style: GoogleFonts.poppins(fontSize: 16)),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order ID: ${order['Order_ID']}",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Text("Total: ₹${order['TotalAmount']}",
                                  style: GoogleFonts.poppins()),
                              Text("Status: ${order['Status']}",
                                  style: GoogleFonts.poppins(
                                      color: order['Status'] == 'Cancelled'
                                          ? Colors.red
                                          : Colors.green)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
