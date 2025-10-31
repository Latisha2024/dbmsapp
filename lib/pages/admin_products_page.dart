import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/pages/get_admin_orders_page.dart';
import 'package:products/pages/user_products_page.dart';
import 'package:products/pages/view_products_page.dart';

// Import all the sub-pages (you already have or will create)
import 'add_product_page.dart';
import 'update_product_page.dart';
import 'delete_product_page.dart';
import 'admin_products_page.dart';
import 'update_order_status_page.dart';
import 'view_orders_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  // Section Title
  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Reusable button style
  Widget _dashboardButton(
    BuildContext context,
    String label,
    IconData icon,
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton.icon(
          icon: Icon(icon, color: Colors.white),
          label: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Same gradient background as login page
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Admin Dashboard 🧑‍💼",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Products Section
                _sectionTitle("🛍️ Products"),
                _dashboardButton(context, "Add Product", Icons.add_box, const AddProductPage()),
                _dashboardButton(context, "Update Product", Icons.update, const UpdateProductPage()),
                _dashboardButton(context, "Delete Product", Icons.delete_forever, const DeleteProductPage()),
                _dashboardButton(context, "View Products", Icons.view_list, const ViewProductsPage()),

                const SizedBox(height: 25),

                // Orders Section
                _sectionTitle("📦 Orders"),
                _dashboardButton(context, "Update Order Status", Icons.edit, const UpdateOrderStatusPage()),
                _dashboardButton(context, "View All Orders", Icons.list_alt, const GetAdminOrdersPage()),

                const SizedBox(height: 40),

                Center(
                  child: Text(
                    "Welcome back, Admin 👋",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
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
