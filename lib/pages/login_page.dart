// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'auth_services.dart';
// import './catalog_page.dart';
// import './role_selection_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool rememberMe = true;
//   bool _obscureText = true;
//   bool _isLoading = false;
//   String? _errorMessage;
//   String? _successMessage;

//   String selectedRole = "user"; // dropdown default

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _loginUser() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _successMessage = null;
//     });

//     try {
//       final dio = AuthService().dio;

//       final response = await dio.post(
//         '/api/users/login',
//         data: {
//           'email': _emailController.text.trim(),
//           'password': _passwordController.text,
//           'role': selectedRole,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         final token = data['token'];
//         final user = data['user'];

//         await AuthService().setToken(token, user);

//         setState(() {
//           _successMessage = 'Login successful!';
//         });

//         // Navigate based on role
//         if (user['role'] == 'user') {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (_) => const CatalogPage()),
//           );
//         } else {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (_) => const RoleSelectionPage()),
//           );
//         }
//       }
//     } on DioException catch (e) {
//       String message = 'An unexpected error occurred.';
//       if (e.response != null) {
//         final data = e.response!.data;
//         if (data is Map && data.containsKey('error')) {
//           message = data['error'];
//         } else if (e.response!.statusCode == 401) {
//           message = 'Invalid email or password.';
//         } else {
//           message = 'Server error: ${e.response!.statusCode}';
//         }
//       } else {
//         message = 'Cannot connect to the server (port 5000).';
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
//       backgroundColor: const Color(0xFFF5F5F5),
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
//                   Color(0xFFFFFBF5), // light cream
//                   Color(0xFFFFF0D9), // soft peach
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

//                 // Role selector dropdown
//                 Text(
//                   "Login as",
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 DropdownButtonFormField<String>(
//                   value: selectedRole,
//                   items: const [
//                     DropdownMenuItem(
//                       value: "user",
//                       child: Text("User"),
//                     ),
//                     DropdownMenuItem(
//                       value: "admin",
//                       child: Text("Admin"),
//                     ),
//                   ],
//                   decoration: InputDecoration(
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
//                   onChanged: (value) {
//                     setState(() {
//                       selectedRole = value!;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),

//                 Text(
//                   "Email address",
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: "Your email",
//                     hintStyle: GoogleFonts.inter(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide:
//                           const BorderSide(color: Colors.black12, width: 1),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 Text(
//                   "Password",
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     hintStyle: GoogleFonts.inter(color: Colors.grey),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
//                         Text("Remember me",
//                             style: GoogleFonts.inter(fontSize: 14)),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {},
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

//                 Center(child: _buildMessage()),
//                 const SizedBox(height: 16),

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
//                     onPressed: _isLoading ? null : _loginUser,
//                     child: _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
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
import 'package:products/pages/admin_products_page.dart';
import 'package:products/pages/signup_page.dart';
import 'package:products/pages/user_dashboard.dart';
import 'package:products/pages/user_products_page.dart';
import 'auth_services.dart';
import './catalog_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = true;
  bool _isLoading = false;
  bool _obscurePassword = true;
  String _selectedRole = "user"; // default

  final AuthService _authService = AuthService();
  final String baseUrl = "http://10.0.2.2:5000/api/users";

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final response = await _authService.dio.post(
        "$baseUrl/login",
        data: {
          "email": _emailController.text.trim(),
          "password": _passwordController.text,
          "role": _selectedRole,
        },
      );

      final data = response.data;
      print("Login response: $data"); // debug

      final token = data["token"];
      final user = data["user"];

      if (token == null || user == null) {
        throw Exception("Invalid response format from server");
      }

      await _authService.setToken(token, user);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _selectedRole == "admin"
              ? const AdminDashboardPage() // Admin page
              : const UserDashboard(), // User page
        ),
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const role_selection_page()),
      // );
    } on DioException catch (e) {
      String errorMessage = "Login failed";
      if (e.response != null && e.response!.data is Map) {
        errorMessage = e.response!.data["message"] ?? errorMessage;
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _isLoading = false);
    }
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Hi, Welcome! 👋",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email field
                    Text(
                      "Email address",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Your email",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your email";
                        }
                        if (!value.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password field
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey[700],
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Role selector (minimalist, matching theme)
                    Text(
                      "Login as",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedRole,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: const [
                            DropdownMenuItem(
                              value: "user",
                              child: Text("User"),
                            ),
                            DropdownMenuItem(
                              value: "admin",
                              child: Text("Admin"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() => _selectedRole = value!);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Remember me + forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: Colors.black,
                              onChanged: (val) {
                                setState(() => _rememberMe = val!);
                              },
                            ),
                            Text(
                              "Remember me",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Log in",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 0.5)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Or",
                            style: GoogleFonts.poppins(color: Colors.black54),
                          ),
                        ),
                        const Expanded(child: Divider(thickness: 0.5)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // // Google Sign In
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: OutlinedButton.icon(
                    //     onPressed: () {},
                    //     icon: Image.asset("assets/google.png", height: 22),
                    //     label: Text(
                    //       "Continue with Google",
                    //       style: GoogleFonts.poppins(
                    //         color: Colors.black87,
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     style: OutlinedButton.styleFrom(
                    //       side: BorderSide(color: Colors.grey.shade300),
                    //       backgroundColor: Colors.white,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 25),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to the Signup Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(text: "Don’t have an account? "),
                              TextSpan(
                                text: "Sign up",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Signup
                    // Center(
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: RichText(
                    //       text: TextSpan(
                    //         style: GoogleFonts.poppins(
                    //             color: Colors.black87, fontSize: 14),
                    //         children: [
                    //           const TextSpan(text: "Don’t have an account? "),
                    //           TextSpan(
                    //             text: "Sign up",
                    //             style: const TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
