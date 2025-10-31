import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_services.dart';

class CancelOrderPage extends StatefulWidget {
  const CancelOrderPage({super.key});

  @override
  State<CancelOrderPage> createState() => _CancelOrderPageState();
}

class _CancelOrderPageState extends State<CancelOrderPage> {
  final TextEditingController orderIdController = TextEditingController();
  bool isLoading = false;
  String? message;

  Future<void> cancelOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    if (userId == null) {
      setState(() {
        message = "User not logged in.";
      });
      return;
    }

    final orderId = orderIdController.text.trim();
    if (orderId.isEmpty) {
      setState(() {
        message = "Please enter a valid Order ID.";
      });
      return;
    }

    setState(() => isLoading = true);

    try {
      final dio = AuthService().dio;
      final response = await dio.delete(
        "http://localhost:5000/api/orders/$userId/$orderId",
      );

      setState(() {
        message = response.data['message'] ?? "Order cancelled successfully!";
      });
    } on DioException catch (e) {
      setState(() {
        message = e.response?.data['message'] ?? "Failed to cancel order.";
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF161B22),
        title: const Text(
          "Cancel Order",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Cancel Pending Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: orderIdController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Order ID",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: const Color(0xFF0D1117),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.white24, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.white24, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: isLoading ? null : cancelOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Cancel Order",
                          style: TextStyle(fontSize: 18),
                        ),
                ),
                const SizedBox(height: 25),
                if (message != null)
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: message!.contains("success")
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
