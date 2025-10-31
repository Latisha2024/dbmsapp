// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:products/pages/add_to_cart_page.dart';
// import 'package:products/pages/remove_cart_item_page.dart';
// import 'package:products/pages/update_cart_item_page.dart';
// import 'package:products/pages/view_cart_page.dart';
// import 'user_products_page.dart';
// import 'get_product_by_id_page.dart';
// import 'place_order_page.dart';
// import 'user_orders_page.dart';
// import 'cancel_order_page.dart';

// class UserDashboard extends StatelessWidget {
//   const UserDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFF9F9F9), Color(0xFFFFEFD5)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView( // ✅ Added scroll view
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "User Dashboard",
//                     style: GoogleFonts.poppins(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   _buildSectionTitle("Products"),
//                   _buildCard(context, "View All Products", const GetUserProductsPage()),
//                   _buildCard(context, "Get Product by ID", const GetProductByIdPage()),
//                   const SizedBox(height: 30),
//                   _buildSectionTitle("Cart"),
//                   _buildCard(context, "Add to cart", const AddToCartPage()),
//                   _buildCard(context, "Update cart", const UpdateCartItemPage()),
//                   _buildCard(context, "Remove item from cart", const RemoveCartItemPage()),
//                   _buildCard(context, "View cart", const ViewCartPage()),
//                   const SizedBox(height: 30),
//                   _buildSectionTitle("Orders"),
//                   _buildCard(context, "Place New Order", const PlaceOrderPage()),
//                   _buildCard(context, "My Orders", const UserOrdersPage()),
//                   _buildCard(context, "Cancel Order", const CancelOrderPage()),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.poppins(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: Colors.black87,
//       ),
//     );
//   }

//   Widget _buildCard(BuildContext context, String title, Widget page) {
//     return GestureDetector(
//       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
//             const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/pages/add_to_cart_page.dart';
import 'package:products/pages/remove_cart_item_page.dart';
import 'package:products/pages/update_cart_item_page.dart';
import 'package:products/pages/view_cart_page.dart';
import 'package:products/pages/view_orders_page.dart';
import 'user_products_page.dart';
import 'get_product_by_id_page.dart';
import 'place_order_page.dart';
import 'cancel_order_page.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF9F9F9), Color(0xFFFFEFD5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView( // ✅ Added scroll view
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Dashboard",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Products"),
                  _buildCard(context, "View All Products", const GetUserProductsPage()),
                  _buildCard(context, "Get Product by ID", const GetProductByIdPage()),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Cart"),
                  _buildCard(context, "Add to cart", const AddToCartPage()),
                  _buildCard(context, "Update cart", const UpdateCartItemPage()),
                  _buildCard(context, "Remove item from cart", const RemoveCartItemPage()),
                  _buildCard(context, "View cart", const ViewCartPage()),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Orders"),
                  _buildCard(context, "Place New Order", const PlaceOrderPage()),
                  _buildCard(context, "My Orders", const ViewOrdersPage()),
                  //_buildCard(context, "Cancel Order", const CancelOrderPage()),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
            const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18),
          ],
        ),
      ),
    );
  }
}
