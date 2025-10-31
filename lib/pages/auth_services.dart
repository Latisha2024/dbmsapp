// // // // // import 'package:dio/dio.dart';
// // // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // // import 'dart:convert';

// // // // // class AuthService {
// // // // //   final Dio _dio = Dio(
// // // // //     BaseOptions(
// // // // //       baseUrl: 'http://10.0.2.2:5000/api', // ✅ matches your local backend
// // // // //       connectTimeout: const Duration(seconds: 10),
// // // // //       receiveTimeout: const Duration(seconds: 10),
// // // // //     ),
// // // // //   );

// // // // //   AuthService._internal();
// // // // //   static final AuthService _instance = AuthService._internal();
// // // // //   factory AuthService() => _instance;

// // // // //   Dio get dio => _dio;

// // // // //   static const _tokenKey = 'auth_token';
// // // // //   static const _userKey = 'user_data';

// // // // //   Future<void> setToken(String token, Map<String, dynamic> user) async {
// // // // //     final prefs = await SharedPreferences.getInstance();
// // // // //     await prefs.setString(_tokenKey, token);
// // // // //     await prefs.setString(_userKey, jsonEncode(user));
// // // // //     _dio.options.headers['Authorization'] = 'Bearer $token';
// // // // //     print("✅ Token saved: $token");
// // // // //     print("✅ User saved: $user");
// // // // //   }

// // // // //   Future<String?> getToken() async {
// // // // //     final prefs = await SharedPreferences.getInstance();
// // // // //     final token = prefs.getString(_tokenKey);
// // // // //     if (token != null) {
// // // // //       _dio.options.headers['Authorization'] = 'Bearer $token';
// // // // //     }
// // // // //     return token;
// // // // //   }

// // // // //   Future<Map<String, dynamic>?> getUser() async {
// // // // //     final prefs = await SharedPreferences.getInstance();
// // // // //     final userString = prefs.getString(_userKey);
// // // // //     if (userString != null) {
// // // // //       return jsonDecode(userString) as Map<String, dynamic>;
// // // // //     }
// // // // //     return null;
// // // // //   }

// // // // //   Future<void> logout() async {
// // // // //     final prefs = await SharedPreferences.getInstance();
// // // // //     await prefs.clear();
// // // // //     _dio.options.headers.remove('Authorization');
// // // // //   }
// // // // // }
// // // // import 'package:dio/dio.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // class AuthService {
// // // //   final Dio dio = Dio(BaseOptions(
// // // //     baseUrl: 'http://10.0.2.2:5000', // local Node backend
// // // //     connectTimeout: const Duration(seconds: 10),
// // // //     receiveTimeout: const Duration(seconds: 10),
// // // //     headers: {'Content-Type': 'application/json'},
// // // //   ));

// // // //   // Save token and user info
// // // //   Future<void> setToken(String token, Map<String, dynamic> user) async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     await prefs.setString('token', token);
// // // //     await prefs.setString('userRole', user['role']);
// // // //     await prefs.setInt('userId', user['id']);
// // // //     await prefs.setString('userName', user['name']);
// // // //   }

// // // //   Future<String?> getToken() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     return prefs.getString('token');
// // // //   }

// // // //   Future<void> clearAuth() async {
// // // //     final prefs = await SharedPreferences.getInstance();
// // // //     await prefs.clear();
// // // //   }
// // // // }
// // // import 'package:dio/dio.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // class AuthService {
// // //   final Dio dio = Dio(
// // //     BaseOptions(
// // //       baseUrl: "http://10.0.2.2:5000/api", // your Node.js backend base URL
// // //       headers: {'Content-Type': 'application/json'},
// // //     ),
// // //   );

// // //   /// ✅ Save token and user info locally
// // //   Future<void> saveUser(String token, Map<String, dynamic> user) async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     await prefs.setString('token', token);
// // //     await prefs.setString('email', user['email'] ?? '');
// // //     await prefs.setString('role', user['role'] ?? '');
// // //     await prefs.setInt('id', user['id']);
// // //   }

// // //   /// ✅ Get saved user info
// // //   Future<Map<String, dynamic>?> getUser() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     final token = prefs.getString('token');
// // //     final email = prefs.getString('email');
// // //     final role = prefs.getString('role');
// // //     final id = prefs.getInt('id');

// // //     if (token == null || id == null) return null;

// // //     // Attach token to Dio for all requests
// // //     dio.options.headers['Authorization'] = 'Bearer $token';

// // //     return {'token': token, 'email': email, 'role': role, 'id': id};
// // //   }

// // //   /// ✅ Clear user info on logout
// // //   Future<void> logout() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     await prefs.clear();
// // //   }
// // // }
// // import 'package:dio/dio.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'dart:convert';

// // class AuthService {
// //   final Dio _dio = Dio(
// //     BaseOptions(
// //       baseUrl: 'http://10.0.2.2:5000/api',
// //       connectTimeout: const Duration(seconds: 10),
// //       receiveTimeout: const Duration(seconds: 10),
// //     ),
// //   );

// //   AuthService._internal();
// //   static final AuthService _instance = AuthService._internal();
// //   factory AuthService() => _instance;

// //   Dio get dio => _dio;

// //   static const _tokenKey = 'auth_token';
// //   static const _userKey = 'user_data';

// //   /// Save token + user in shared preferences
// //   Future<void> setToken(String token, Map<String, dynamic> user) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString(_tokenKey, token);
// //     await prefs.setString(_userKey, jsonEncode(user));
// //     _dio.options.headers['Authorization'] = 'Bearer $token';

// //     print("✅ Token saved: $token");
// //     print("✅ User saved: $user");
// //   }

// //   /// Get token
// //   Future<String?> getToken() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     return prefs.getString(_tokenKey);
// //   }

// //   /// Get user data
// //   Future<Map<String, dynamic>?> getUser() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final userString = prefs.getString(_userKey);
// //     if (userString != null) {
// //       return jsonDecode(userString) as Map<String, dynamic>;
// //     }
// //     return null;
// //   }

// //   /// Remove token + user
// //   Future<void> logout() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.clear();
// //     _dio.options.headers.remove('Authorization');
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class AuthService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: '',
//     ),
//   );

//   AuthService._internal();
//   static final AuthService _instance = AuthService._internal();
//   factory AuthService() => _instance;

//   Dio get dio => _dio;

//   static const _tokenKey = 'auth_token';
//   static const _userKey = 'user_data';

//   Future<void> setToken(String token, Map<String, dynamic> user) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//     await prefs.setString(_userKey, jsonEncode(user));
//     _dio.options.headers['Authorization'] = 'Bearer $token';

//     print("✅ Token saved: $token");
//     print("✅ User saved: $user");
//   }

//   /// Get token
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }

//   Future<Map<String, dynamic>?> getUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString(_userKey);
//     if (userString != null) {
//       return jsonDecode(userString) as Map<String, dynamic>;
//     }
//     return null;
//   }

//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     _dio.options.headers.remove('Authorization');
//   }
// }
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  late Dio _dio;
  static const _baseUrl = "http://localhost:5000/api";
  static const _tokenKey = 'auth_token';
  static const _userKey = 'user_data';

  AuthService._internal() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Dio get dio => _dio;

  Future<void> setToken(String token, Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, jsonEncode(user));
    _dio.options.headers['Authorization'] = 'Bearer $token';
    print("✅ Token saved: $token");
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);
    if (userString != null) return jsonDecode(userString);
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _dio.options.headers.remove('Authorization');
  }
}
