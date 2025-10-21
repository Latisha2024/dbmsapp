// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   bool rememberMe = true;
// // //   bool _obscureText = true;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F5F5), // light grey background
// // //       body: Center(
// // //         child: SingleChildScrollView(
// // //           child: Container(
// // //             width: 400,
// // //             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
// // //             decoration: BoxDecoration(
// // //               gradient: const LinearGradient(
// // //                 begin: Alignment.topCenter,
// // //                 end: Alignment.bottomCenter,
// // //                 colors: [
// // //                   Color(0xFFFFFBF5), // very light cream
// // //                   Color(0xFFFFF0D9), // soft peachy beige
// // //                 ],
// // //               ),
// // //               borderRadius: BorderRadius.circular(16),
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: Colors.black.withOpacity(0.05),
// // //                   blurRadius: 12,
// // //                   spreadRadius: 3,
// // //                   offset: const Offset(0, 4),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Center(
// // //                   child: Text(
// // //                     "Hi, Welcome! 👋",
// // //                     style: GoogleFonts.inter(
// // //                       fontSize: 26,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Colors.black,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 36),

// // //                 // Email
// // //                 Text(
// // //                   "Email address",
// // //                   style: GoogleFonts.inter(
// // //                     fontSize: 14,
// // //                     color: Colors.black87,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 TextField(
// // //                   decoration: InputDecoration(
// // //                     hintText: "Your email",
// // //                     hintStyle: GoogleFonts.inter(color: Colors.grey),
// // //                     filled: true,
// // //                     fillColor: Colors.white,
// // //                     contentPadding: const EdgeInsets.symmetric(
// // //                         horizontal: 16, vertical: 14),
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(12),
// // //                       borderSide:
// // //                           const BorderSide(color: Colors.black12, width: 1),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 20),

// // //                 // Password
// // //                 Text(
// // //                   "Password",
// // //                   style: GoogleFonts.inter(
// // //                     fontSize: 14,
// // //                     color: Colors.black87,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 TextField(
// // //                   obscureText: _obscureText,
// // //                   decoration: InputDecoration(
// // //                     hintText: "Password",
// // //                     hintStyle: GoogleFonts.inter(color: Colors.grey),
// // //                     filled: true,
// // //                     fillColor: Colors.white,
// // //                     contentPadding: const EdgeInsets.symmetric(
// // //                         horizontal: 16, vertical: 14),
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(12),
// // //                       borderSide:
// // //                           const BorderSide(color: Colors.black12, width: 1),
// // //                     ),
// // //                     suffixIcon: IconButton(
// // //                       icon: Icon(
// // //                         _obscureText
// // //                             ? Icons.visibility_off_outlined
// // //                             : Icons.visibility_outlined,
// // //                         color: Colors.grey[600],
// // //                       ),
// // //                       onPressed: () {
// // //                         setState(() {
// // //                           _obscureText = !_obscureText;
// // //                         });
// // //                       },
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 12),

// // //                 // Remember me / Forgot password
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Row(
// // //                       children: [
// // //                         Checkbox(
// // //                           value: rememberMe,
// // //                           onChanged: (value) {
// // //                             setState(() {
// // //                               rememberMe = value ?? false;
// // //                             });
// // //                           },
// // //                           activeColor: Colors.black,
// // //                           shape: const CircleBorder(),
// // //                         ),
// // //                         Text(
// // //                           "Remember me",
// // //                           style: GoogleFonts.inter(fontSize: 14),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     TextButton(
// // //                       onPressed: () {},
// // //                       style: TextButton.styleFrom(
// // //                         padding: EdgeInsets.zero,
// // //                         minimumSize: const Size(50, 30),
// // //                       ),
// // //                       child: Text(
// // //                         "Forgot password?",
// // //                         style: GoogleFonts.inter(
// // //                           fontSize: 14,
// // //                           color: Colors.black,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 20),

// // //                 // Login button
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   height: 55,
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: Colors.black,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(14),
// // //                       ),
// // //                       elevation: 0,
// // //                     ),
// // //                     onPressed: () {},
// // //                     child: Text(
// // //                       "Log in",
// // //                       style: GoogleFonts.inter(
// // //                         color: Colors.white,
// // //                         fontWeight: FontWeight.w600,
// // //                         fontSize: 16,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Divider
// // //                 Row(
// // //                   children: [
// // //                     const Expanded(
// // //                       child: Divider(
// // //                         color: Colors.black26,
// // //                         thickness: 1,
// // //                       ),
// // //                     ),
// // //                     Padding(
// // //                       padding: const EdgeInsets.symmetric(horizontal: 8),
// // //                       child: Text(
// // //                         "Or",
// // //                         style: GoogleFonts.inter(color: Colors.black54),
// // //                       ),
// // //                     ),
// // //                     const Expanded(
// // //                       child: Divider(
// // //                         color: Colors.black26,
// // //                         thickness: 1,
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 24),

// // //                 // Google Sign In
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   height: 55,
// // //                   child: OutlinedButton.icon(
// // //                     style: OutlinedButton.styleFrom(
// // //                       backgroundColor: Colors.white,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       side: const BorderSide(color: Colors.black12),
// // //                     ),
// // //                     icon: Image.network(
// // //                       "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
// // //                       height: 24,
// // //                     ),
// // //                     label: Text(
// // //                       "Continue with Google",
// // //                       style: GoogleFonts.inter(
// // //                         fontSize: 15,
// // //                         color: Colors.black,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                     onPressed: () {},
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 30),

// // //                 // Sign Up
// // //                 Center(
// // //                   child: RichText(
// // //                     text: TextSpan(
// // //                       text: "Don’t have an account? ",
// // //                       style: GoogleFonts.inter(
// // //                         fontSize: 14,
// // //                         color: Colors.black87,
// // //                       ),
// // //                       children: [
// // //                         TextSpan(
// // //                           text: "Sign up",
// // //                           style: GoogleFonts.inter(
// // //                             fontSize: 14,
// // //                             color: Colors.black,
// // //                             fontWeight: FontWeight.w600,
// // //                             decoration: TextDecoration.underline,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:dio/dio.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   // 1. Controllers for text fields
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
  
// //   // 2. State variables
// //   bool rememberMe = true;
// //   bool _obscureText = true;
// //   bool _isLoading = false;
// //   String? _errorMessage;
// //   String? _successMessage;

// //   // API Configuration
// //   final String _apiUrl = "http://localhost:5000/api/users/login";
// //   final Dio _dio = Dio();

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   // 3. Login Logic
// //   Future<void> _loginUser() async {
// //     setState(() {
// //       _isLoading = true;
// //       _errorMessage = null;
// //       _successMessage = null;
// //     });

// //     try {
// //       final response = await _dio.post(
// //         _apiUrl,
// //         data: {
// //           'email': _emailController.text.trim(),
// //           'password': _passwordController.text,
// //         },
// //         options: Options(
// //           headers: {
// //             // Necessary header for sending JSON data
// //             'Content-Type': 'application/json',
// //           },
// //         ),
// //       );

// //       if (response.statusCode == 200) {
// //         // Login successful
// //         setState(() {
// //           _successMessage = response.data['message'] ?? 'Login successful!';
// //         });
// //         // In a real app, you would save the token and navigate to the dashboard
// //         print('Login Success! Token: ${response.data['token']}');
// //       }
// //     } on DioException catch (e) {
// //       String message = 'An unexpected error occurred.';
// //       // Handle HTTP status errors (4xx, 5xx)
// //       if (e.response != null) {
// //         final data = e.response!.data;
// //         if (data is Map && data.containsKey('error')) {
// //           // Use the specific error message from the Node.js backend
// //           message = data['error'];
// //         } else if (e.response!.statusCode == 400) {
// //           message = 'Missing email or password.';
// //         } else if (e.response!.statusCode == 401) {
// //           message = 'Invalid credentials or user not found.';
// //         } else if (e.response!.statusCode == 500) {
// //           message = 'Server encountered an internal error.';
// //         } else {
// //           message = 'Server Error: Status ${e.response!.statusCode}';
// //         }
// //       } else {
// //         // Handle network errors (e.g., server not running, connection refused)
// //         message = 'Cannot connect to server. Ensure your backend is running on port 5000.';
// //       }
      
// //       setState(() {
// //         _errorMessage = message;
// //       });
      
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   // Helper widget to display messages
// //   Widget _buildMessage() {
// //     if (_errorMessage != null) {
// //       return Text(
// //         _errorMessage!,
// //         style: GoogleFonts.inter(
// //           color: Colors.red[600],
// //           fontWeight: FontWeight.w500,
// //         ),
// //         textAlign: TextAlign.center,
// //       );
// //     }
// //     if (_successMessage != null) {
// //       return Text(
// //         _successMessage!,
// //         style: GoogleFonts.inter(
// //           color: Colors.green[600],
// //           fontWeight: FontWeight.w500,
// //         ),
// //         textAlign: TextAlign.center,
// //       );
// //     }
// //     return const SizedBox.shrink();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F5F5), // light grey background
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Container(
// //             width: 400,
// //             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
// //             decoration: BoxDecoration(
// //               gradient: const LinearGradient(
// //                 begin: Alignment.topCenter,
// //                 end: Alignment.bottomCenter,
// //                 colors: [
// //                   Color(0xFFFFFBF5), // very light cream
// //                   Color(0xFFFFF0D9), // soft peachy beige
// //                 ],
// //               ),
// //               borderRadius: BorderRadius.circular(16),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black.withOpacity(0.05),
// //                   blurRadius: 12,
// //                   spreadRadius: 3,
// //                   offset: const Offset(0, 4),
// //                 ),
// //               ],
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Center(
// //                   child: Text(
// //                     "Hi, Welcome! 👋",
// //                     style: GoogleFonts.inter(
// //                       fontSize: 26,
// //                       fontWeight: FontWeight.w700,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 36),

// //                 // Email
// //                 Text(
// //                   "Email address",
// //                   style: GoogleFonts.inter(
// //                     fontSize: 14,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 TextField(
// //                   controller: _emailController, // BIND CONTROLLER
// //                   keyboardType: TextInputType.emailAddress,
// //                   decoration: InputDecoration(
// //                     hintText: "Your email",
// //                     hintStyle: GoogleFonts.inter(color: Colors.grey),
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                     contentPadding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide:
// //                           const BorderSide(color: Colors.black12, width: 1),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),

// //                 // Password
// //                 Text(
// //                   "Password",
// //                   style: GoogleFonts.inter(
// //                     fontSize: 14,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 TextField(
// //                   controller: _passwordController, // BIND CONTROLLER
// //                   obscureText: _obscureText,
// //                   decoration: InputDecoration(
// //                     hintText: "Password",
// //                     hintStyle: GoogleFonts.inter(color: Colors.grey),
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                     contentPadding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide:
// //                           const BorderSide(color: Colors.black12, width: 1),
// //                     ),
// //                     suffixIcon: IconButton(
// //                       icon: Icon(
// //                         _obscureText
// //                             ? Icons.visibility_off_outlined
// //                             : Icons.visibility_outlined,
// //                         color: Colors.grey[600],
// //                       ),
// //                       onPressed: () {
// //                         setState(() {
// //                           _obscureText = !_obscureText;
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 12),

// //                 // Remember me / Forgot password
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Row(
// //                       children: [
// //                         Checkbox(
// //                           value: rememberMe,
// //                           onChanged: (value) {
// //                             setState(() {
// //                               rememberMe = value ?? false;
// //                             });
// //                           },
// //                           activeColor: Colors.black,
// //                           shape: const CircleBorder(),
// //                         ),
// //                         Text(
// //                           "Remember me",
// //                           style: GoogleFonts.inter(fontSize: 14),
// //                         ),
// //                       ],
// //                     ),
// //                     TextButton(
// //                       onPressed: () {},
// //                       style: TextButton.styleFrom(
// //                         padding: EdgeInsets.zero,
// //                         minimumSize: const Size(50, 30),
// //                       ),
// //                       child: Text(
// //                         "Forgot password?",
// //                         style: GoogleFonts.inter(
// //                           fontSize: 14,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20),
                
// //                 // Message display area
// //                 Center(child: _buildMessage()),
// //                 const SizedBox(height: 16),

// //                 // Login button
// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 55,
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.black,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(14),
// //                       ),
// //                       elevation: 0,
// //                     ),
// //                     onPressed: _isLoading ? null : _loginUser, // CALL LOGIN FUNCTION
// //                     child: _isLoading
// //                         ? const CircularProgressIndicator(
// //                             color: Colors.white,
// //                           )
// //                         : Text(
// //                             "Log in",
// //                             style: GoogleFonts.inter(
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.w600,
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Divider
// //                 Row(
// //                   children: [
// //                     const Expanded(
// //                       child: Divider(
// //                         color: Colors.black26,
// //                         thickness: 1,
// //                       ),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 8),
// //                       child: Text(
// //                         "Or",
// //                         style: GoogleFonts.inter(color: Colors.black54),
// //                       ),
// //                     ),
// //                     const Expanded(
// //                       child: Divider(
// //                         color: Colors.black26,
// //                         thickness: 1,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // Google Sign In (Unchanged)
// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 55,
// //                   child: OutlinedButton.icon(
// //                     style: OutlinedButton.styleFrom(
// //                       backgroundColor: Colors.white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       side: const BorderSide(color: Colors.black12),
// //                     ),
// //                     icon: Image.network(
// //                       "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
// //                       height: 24,
// //                     ),
// //                     label: Text(
// //                       "Continue with Google",
// //                       style: GoogleFonts.inter(
// //                         fontSize: 15,
// //                         color: Colors.black,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                     onPressed: () {},
// //                   ),
// //                 ),
// //                 const SizedBox(height: 30),

// //                 // Sign Up (Unchanged)
// //                 Center(
// //                   child: RichText(
// //                     text: TextSpan(
// //                       text: "Don’t have an account? ",
// //                       style: GoogleFonts.inter(
// //                         fontSize: 14,
// //                         color: Colors.black87,
// //                       ),
// //                       children: [
// //                         TextSpan(
// //                           text: "Sign up",
// //                           style: GoogleFonts.inter(
// //                             fontSize: 14,
// //                             color: Colors.black,
// //                             fontWeight: FontWeight.w600,
// //                             decoration: TextDecoration.underline,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:dio/dio.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // 1. Controllers for text fields
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
  
//   // 2. State variables
//   bool rememberMe = true;
//   bool _obscureText = true;
//   bool _isLoading = false;
//   String? _errorMessage;
//   String? _successMessage;

//   // API Configuration
//   // 💡 FIX: Changed localhost to 10.0.2.2 for Android emulator compatibility.
//   final String _apiUrl = "http://10.0.2.2:5000/api/users/login";
//   final Dio _dio = Dio();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // 3. Login Logic
//   Future<void> _loginUser() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     try {
//       final response = await _dio.post(
//         _apiUrl,
//         data: {
//           'email': _emailController.text.trim(),
//           'password': _passwordController.text,
//         },
//         options: Options(
//           headers: {
//             // Necessary header for sending JSON data
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         // Login successful
//         setState(() {
//           _successMessage = response.data['message'] ?? 'Login successful!';
//         });
//         // In a real app, you would save the token and navigate to the dashboard
//         print('Login Success! Token: ${response.data['token']}');
//       }
//     } on DioException catch (e) {
//       String message = 'An unexpected error occurred.';
//       // Handle HTTP status errors (4xx, 5xx)
//       if (e.response != null) {
//         final data = e.response!.data;
//         if (data is Map && data.containsKey('error')) {
//           // Use the specific error message from the Node.js backend
//           message = data['error'];
//         } else if (e.response!.statusCode == 400) {
//           message = 'Missing email or password.';
//         } else if (e.response!.statusCode == 401) {
//           message = 'Invalid credentials or user not found.';
//         } else if (e.response!.statusCode == 500) {
//           message = 'Server encountered an internal error.';
//         } else {
//           message = 'Server Error: Status ${e.response!.statusCode}';
//         }
//       } else {
//         // Handle network errors (e.g., server not running, connection refused)
//         message = 'Cannot connect to server. Ensure your backend is running on port 5000.';
//       }
      
//       setState(() {
//         _errorMessage = message;
//       });
      
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Helper widget to display messages
//   Widget _buildMessage() {
//     if (_errorMessage != null) {
//       return Text(
//         _errorMessage!,
//         style: GoogleFonts.inter(
//           color: Colors.red[600],
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       );
//     }
//     if (_successMessage != null) {
//       return Text(
//         _successMessage!,
//         style: GoogleFonts.inter(
//           color: Colors.green[600],
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       );
//     }
//     return const SizedBox.shrink();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5), // light grey background
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             width: 400,
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFFFFFBF5), // very light cream
//                   Color(0xFFFFF0D9), // soft peachy beige
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 12,
//                   spreadRadius: 3,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     "Hi, Welcome! 👋",
//                     style: GoogleFonts.inter(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 36),

//                 // Email
//                 Text(
//                   "Email address",
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _emailController, // BIND CONTROLLER
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: "Your email",
//                     hintStyle: GoogleFonts.inter(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide:
//                           const BorderSide(color: Colors.black12, width: 1),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Password
//                 Text(
//                   "Password",
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _passwordController, // BIND CONTROLLER
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     hintStyle: GoogleFonts.inter(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide:
//                           const BorderSide(color: Colors.black12, width: 1),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText
//                             ? Icons.visibility_off_outlined
//                             : Icons.visibility_outlined,
//                         color: Colors.grey[600],
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 // Remember me / Forgot password
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: rememberMe,
//                           onChanged: (value) {
//                             setState(() {
//                               rememberMe = value ?? false;
//                             });
//                           },
//                           activeColor: Colors.black,
//                           shape: const CircleBorder(),
//                         ),
//                         Text(
//                           "Remember me",
//                           style: GoogleFonts.inter(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         minimumSize: const Size(50, 30),
//                       ),
//                       child: Text(
//                         "Forgot password?",
//                         style: GoogleFonts.inter(
//                           fontSize: 14,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
                
//                 // Message display area
//                 Center(child: _buildMessage()),
//                 const SizedBox(height: 16),

//                 // Login button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                       elevation: 0,
//                     ),
//                     onPressed: _isLoading ? null : _loginUser, // CALL LOGIN FUNCTION
//                     child: _isLoading
//                         ? const CircularProgressIndicator(
//                             color: Colors.white,
//                           )
//                         : Text(
//                             "Log in",
//                             style: GoogleFonts.inter(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Divider
//                 Row(
//                   children: [
//                     const Expanded(
//                       child: Divider(
//                         color: Colors.black26,
//                         thickness: 1,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text(
//                         "Or",
//                         style: GoogleFonts.inter(color: Colors.black54),
//                       ),
//                     ),
//                     const Expanded(
//                       child: Divider(
//                         color: Colors.black26,
//                         thickness: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),

//                 // Google Sign In (Unchanged)
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: OutlinedButton.icon(
//                     style: OutlinedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       side: const BorderSide(color: Colors.black12),
//                     ),
//                     icon: Image.network(
//                       "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
//                       height: 24,
//                     ),
//                     label: Text(
//                       "Continue with Google",
//                       style: GoogleFonts.inter(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Sign Up (Unchanged)
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Don’t have an account? ",
//                       style: GoogleFonts.inter(
//                         fontSize: 14,
//                         color: Colors.black87,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "Sign up",
//                           style: GoogleFonts.inter(
//                             fontSize: 14,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';

// 💡 NEW: Import your existing CatalogPage from its file.
// NOTE: You may need to adjust the path/file name if it's different (e.g., './catalog.dart').
import './catalog_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // 2. State variables
  bool rememberMe = true;
  bool _obscureText = true;
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  // API Configuration
  final String _apiUrl = "http://10.0.2.2:5000/api/users/login";
  final Dio _dio = Dio();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 3. Login Logic
  Future<void> _loginUser() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      final response = await _dio.post(
        _apiUrl,
        data: {
          'email': _emailController.text.trim(),
          'password': _passwordController.text,
        },
        options: Options(
          headers: {
            // Necessary header for sending JSON data
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Login successful
        
        // 🚀 NAVIGATION: Uses the imported CatalogPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CatalogPage()),
        );

        // This success message update will likely be skipped due to navigation, 
        // but kept here for logical clarity if navigation were removed later.
        setState(() {
          _successMessage = response.data['message'] ?? 'Login successful!';
        });
        print('Login Success! Token: ${response.data['token']}');
      }
    } on DioException catch (e) {
      String message = 'An unexpected error occurred.';
      // Handle HTTP status errors (4xx, 5xx)
      if (e.response != null) {
        final data = e.response!.data;
        if (data is Map && data.containsKey('error')) {
          // Use the specific error message from the Node.js backend
          message = data['error'];
        } else if (e.response!.statusCode == 400) {
          message = 'Missing email or password.';
        } else if (e.response!.statusCode == 401) {
          message = 'Invalid credentials or user not found.';
        } else if (e.response!.statusCode == 500) {
          message = 'Server encountered an internal error.';
        } else {
          message = 'Server Error: Status ${e.response!.statusCode}';
        }
      } else {
        // Handle network errors (e.g., server not running, connection refused)
        message = 'Cannot connect to server. Ensure your backend is running on port 5000.';
      }
      
      setState(() {
        _errorMessage = message;
      });
      
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Helper widget to display messages
  Widget _buildMessage() {
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: GoogleFonts.inter(
          color: Colors.red[600],
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      );
    }
    if (_successMessage != null) {
      return Text(
        _successMessage!,
        style: GoogleFonts.inter(
          color: Colors.green[600],
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // light grey background
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFBF5), // very light cream
                  Color(0xFFFFF0D9), // soft peachy beige
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Hi, Welcome! 👋",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 36),

                // Email
                Text(
                  "Email address",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController, // BIND CONTROLLER
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Your email",
                    hintStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password
                Text(
                  "Password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController, // BIND CONTROLLER
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Remember me / Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                          activeColor: Colors.black,
                          shape: const CircleBorder(),
                        ),
                        Text(
                          "Remember me",
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                      ),
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Message display area
                Center(child: _buildMessage()),
                const SizedBox(height: 16),

                // Login button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _isLoading ? null : _loginUser, // CALL LOGIN FUNCTION
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Log in",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black26,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Or",
                        style: GoogleFonts.inter(color: Colors.black54),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black26,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Google Sign In (Unchanged)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.black12),
                    ),
                    icon: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                      height: 24,
                    ),
                    label: Text(
                      "Continue with Google",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up (Unchanged)
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
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

