// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'auth_services.dart'; // adjust path if needed

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final AuthService _authService = AuthService();
//   final TextEditingController _productIdController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   bool _loading = false;
//   List<dynamic> _cartItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadCart();
//   }

//   Future<void> _loadCart() async {
//     setState(() => _loading = true);
//     try {
//       final user = await _authService.getUser();
//       if (user == null) return;

//       final dio = _authService.dio;
//       final response = await dio.get('/cart/${user['id']}');

//       setState(() {
//         _cartItems = response.data;
//       });
//     } on DioException catch (e) {
//       print("❌ Failed to load cart: ${e.response?.data ?? e.message}");
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   Future<void> _addToCart() async {
//     final productId = int.tryParse(_productIdController.text.trim());
//     final quantity = int.tryParse(_quantityController.text.trim());

//     if (productId == null || quantity == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Enter valid Product ID and Quantity")),
//       );
//       return;
//     }

//     setState(() => _loading = true);

//     try {
//       final dio = _authService.dio;
//       final response = await dio.post('/cart/add', data: {
//         "Product_ID": productId,
//         "Quantity": quantity,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(response.data['message'] ?? "Item added")),
//       );

//       _productIdController.clear();
//       _quantityController.clear();
//       _loadCart(); // refresh
//     } on DioException catch (e) {
//       final msg = e.response?.data?['message'] ?? e.message ?? "Error";
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("❌ $msg")));
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   Future<void> _updateCartItem(int cartId, int newQuantity) async {
//     try {
//       final dio = _authService.dio;
//       final response = await dio.put('/cart/$cartId', data: {
//         "Quantity": newQuantity,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(response.data['message'] ?? "Updated")),
//       );
//       _loadCart();
//     } on DioException catch (e) {
//       final msg = e.response?.data?['message'] ?? e.message ?? "Error";
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("❌ $msg")));
//     }
//   }

//   Future<void> _removeCartItem(int cartId) async {
//     try {
//       final dio = _authService.dio;
//       final response = await dio.delete('/cart/$cartId');

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(response.data['message'] ?? "Removed")),
//       );
//       _loadCart();
//     } on DioException catch (e) {
//       final msg = e.response?.data?['message'] ?? e.message ?? "Error";
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("❌ $msg")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("🛍 Cart")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Input fields
//             TextField(
//               controller: _productIdController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Product ID",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _quantityController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Quantity",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _loading ? null : _addToCart,
//               child: _loading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Add to Cart"),
//             ),
//             const SizedBox(height: 20),

//             // Cart list
//             Expanded(
//               child: _loading
//                   ? const Center(child: CircularProgressIndicator())
//                   : _cartItems.isEmpty
//                       ? const Center(child: Text("No items in cart"))
//                       : ListView.builder(
//                           itemCount: _cartItems.length,
//                           itemBuilder: (context, index) {
//                             final item = _cartItems[index];
//                             final product = item['Product'] ?? {};
//                             return Card(
//                               elevation: 3,
//                               margin: const EdgeInsets.symmetric(vertical: 5),
//                               child: ListTile(
//                                 title: Text(product['Product_Name'] ??
//                                     "Product #${item['Product_ID']}"),
//                                 subtitle: Text(
//                                   "Qty: ${item['Quantity']} | Stock: ${product['Stock'] ?? 'N/A'}",
//                                 ),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit),
//                                       onPressed: () async {
//                                         final controller =
//                                             TextEditingController(
//                                                 text:
//                                                     item['Quantity'].toString());
//                                         final result =
//                                             await showDialog<int?>(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                             title:
//                                                 const Text("Update Quantity"),
//                                             content: TextField(
//                                               controller: controller,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               decoration:
//                                                   const InputDecoration(
//                                                       labelText: "Quantity"),
//                                             ),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () => Navigator.pop(
//                                                     context, null),
//                                                 child: const Text("Cancel"),
//                                               ),
//                                               ElevatedButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(
//                                                     context,
//                                                     int.tryParse(
//                                                         controller.text),
//                                                   );
//                                                 },
//                                                 child: const Text("Update"),
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                         if (result != null &&
//                                             result > 0 &&
//                                             result != item['Quantity']) {
//                                           _updateCartItem(
//                                               item['Cart_ID'], result);
//                                         }
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete),
//                                       onPressed: () =>
//                                           _removeCartItem(item['Cart_ID']),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'auth_services.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final dio = AuthService().dio;
  List<dynamic> cartItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    setState(() => isLoading = true);

    try {
      final token = await AuthService().getToken();
      if (token == null) {
        throw Exception("No token found. Please log in again.");
      }

      // The base URL is already set in AuthService
      final response = await dio.get('/api/cart');

      if (response.statusCode == 200) {
        setState(() {
          cartItems = response.data['items'] ?? [];
        });
      } else {
        throw Exception("Failed to fetch cart items");
      }
    } on DioException catch (e) {
      debugPrint("❌ Cart fetch error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.response?.data['message'] ?? 'Failed to load cart')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      final response = await dio.delete('/api/cart/$productId');
      if (response.statusCode == 200) {
        setState(() {
          cartItems.removeWhere((item) => item['productId'] == productId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item removed from cart')),
        );
      }
    } on DioException catch (e) {
      debugPrint("❌ Remove cart error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.response?.data['message'] ?? 'Failed to remove item')),
      );
    }
  }

  Future<void> checkout() async {
    try {
      final response = await dio.post('/api/checkout');

      if (response.statusCode == 200) {
        setState(() => cartItems = []);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Checkout successful!')),
        );
        Navigator.pushReplacementNamed(context, '/orderHistory');
      }
    } on DioException catch (e) {
      debugPrint("❌ Checkout error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.response?.data['message'] ?? 'Checkout failed')),
      );
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += (item['price'] ?? 0) * (item['quantity'] ?? 1);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchCartItems,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : cartItems.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: ListTile(
                              leading: item['imageUrl'] != null
                                  ? Image.network(item['imageUrl'], width: 50, height: 50, fit: BoxFit.cover)
                                  : const Icon(Icons.image_not_supported, size: 50),
                              title: Text(item['name'] ?? 'Unnamed Product'),
                              subtitle: Text(
                                '₹${item['price']} × ${item['quantity']}',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => removeFromCart(item['productId'].toString()),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: const Border(top: BorderSide(color: Colors.grey)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Total: ₹${getTotalPrice().toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: checkout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Proceed to Checkout', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}

