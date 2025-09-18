import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/catalog_page.dart';
import 'pages/cart_page.dart';
import 'pages/product_detail_page.dart';
import 'pages/order_history_page.dart';
import 'pages/role_selection_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/catalog': (context) => const CatalogPage(),
        '/cart': (context) => const CartPage(),
        '/productDetail': (context) => const ProductDetailPage(),
        '/orderHistory': (context) => const OrderHistoryPage(),
        '/roleSelection': (context) => const RoleSelectionPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
