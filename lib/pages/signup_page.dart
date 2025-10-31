// // // import 'package:flutter/material.dart';
// // // import 'package:dio/dio.dart';
// // // import 'auth_services.dart';

// // // class SignupPage extends StatefulWidget {
// // //   final String role;
// // //   const SignupPage({super.key, required this.role});

// // //   @override
// // //   State<SignupPage> createState() => _SignupPageState();
// // // }

// // // class _SignupPageState extends State<SignupPage> {
// // //   final Dio dio = AuthService().dio;

// // //   final nameController = TextEditingController();
// // //   final phoneController = TextEditingController();
// // //   final emailController = TextEditingController();
// // //   final passwordController = TextEditingController();
// // //   final addressController = TextEditingController();

// // //   bool isLoading = false;
// // //   String? errorMessage;

// // //   Future<void> register() async {
// // //     setState(() {
// // //       isLoading = true;
// // //       errorMessage = null;
// // //     });

// // //     try {
// // //       final response = await dio.post(
// // //         '/api/users/register',
// // //         data: {
// // //           "name": nameController.text.trim(),
// // //           "phone_no": phoneController.text.trim(),
// // //           "email": emailController.text.trim(),
// // //           "password": passwordController.text.trim(),
// // //           "address": widget.role == "user" ? addressController.text.trim() : null,
// // //           "role": widget.role,
// // //         },
// // //       );

// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(content: Text(response.data['message'] ?? "Registered successfully")),
// // //       );

// // //       Navigator.pop(context); // Go back to login

// // //     } on DioException catch (e) {
// // //       setState(() {
// // //         errorMessage = e.response?.data['message'] ?? "Registration failed";
// // //       });
// // //     } finally {
// // //       setState(() => isLoading = false);
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final isUser = widget.role == "user";

// // //     return Scaffold(
// // //       appBar: AppBar(title: Text("${widget.role.toUpperCase()} Signup")),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(20),
// // //         child: Column(
// // //           children: [
// // //             TextField(
// // //               controller: nameController,
// // //               decoration: const InputDecoration(labelText: "Full Name"),
// // //             ),
// // //             TextField(
// // //               controller: phoneController,
// // //               decoration: const InputDecoration(labelText: "Phone Number"),
// // //               keyboardType: TextInputType.phone,
// // //             ),
// // //             TextField(
// // //               controller: emailController,
// // //               decoration: const InputDecoration(labelText: "Email"),
// // //             ),
// // //             TextField(
// // //               controller: passwordController,
// // //               decoration: const InputDecoration(labelText: "Password"),
// // //               obscureText: true,
// // //             ),
// // //             if (isUser)
// // //               TextField(
// // //                 controller: addressController,
// // //                 decoration: const InputDecoration(labelText: "Address"),
// // //               ),
// // //             const SizedBox(height: 20),
// // //             if (errorMessage != null)
// // //               Text(errorMessage!, style: const TextStyle(color: Colors.red)),
// // //             ElevatedButton(
// // //               onPressed: isLoading ? null : register,
// // //               child: isLoading
// // //                   ? const CircularProgressIndicator(color: Colors.white)
// // //                   : const Text("Register"),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'auth_services.dart';

// // class SignUpPage extends StatefulWidget {
// //   const SignUpPage({super.key});

// //   @override
// //   State<SignUpPage> createState() => _SignUpPageState();
// // }

// // class _SignUpPageState extends State<SignUpPage> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   bool isLoading = false;

// //   Future<void> signUpUser() async {
// //     setState(() => isLoading = true);

// //     try {
// //       final response = await AuthService().dio.post(
// //         '/api/register',
// //         data: {
// //           'name': nameController.text.trim(),
// //           'email': emailController.text.trim(),
// //           'password': passwordController.text.trim(),
// //         },
// //       );

// //       if (response.statusCode == 201) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Signup successful! Please log in.')),
// //         );
// //         Navigator.pushReplacementNamed(context, '/');
// //       }
// //     } on DioException catch (e) {
// //       String errorMessage = 'Signup failed';
// //       if (e.response != null && e.response?.data != null) {
// //         errorMessage = e.response?.data['message'] ?? errorMessage;
// //       }
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
// //     } finally {
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Text('Sign Up', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
// //               const SizedBox(height: 16),
// //               TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
// //               TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
// //               TextField(
// //                 controller: passwordController,
// //                 obscureText: true,
// //                 decoration: const InputDecoration(labelText: 'Password'),
// //               ),
// //               const SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: isLoading ? null : signUpUser,
// //                 child: isLoading
// //                     ? const CircularProgressIndicator(color: Colors.white)
// //                     : const Text('Sign Up'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'login_page.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String _role = "user";
//   bool _loading = false;

//   // ⚠️ Use 10.0.2.2 for emulator instead of localhost
//   final Dio _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api/users"));

//   Future<void> _register() async {
//     if (!_formKey.currentState!.validate()) return;
//     setState(() => _loading = true);

//     try {
//       final data = {
//         "name": _nameController.text.trim(),
//         "email": _emailController.text.trim(),
//         "phone_no": _phoneController.text.trim(),
//         "password": _passwordController.text.trim(),
//         "address": _role == "user" ? _addressController.text.trim() : null,
//         "role": _role
//       };

//       final response = await _dio.post("/register", data: data);

//       if (response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "Registration successful! Please login.",
//               style: GoogleFonts.poppins(color: Colors.white),
//             ),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const LoginPage()),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data["message"] ?? "Registration failed!";
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content:
//               Text(msg, style: GoogleFonts.poppins(color: Colors.white)),
//           backgroundColor: Colors.redAccent,
//         ),
//       );
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = const Color(0xFF004AAD); // same as login
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // 🔹 Header
//               Text(
//                 "Create Account",
//                 style: GoogleFonts.poppins(
//                   color: themeColor,
//                   fontSize: 32,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "Sign up to get started",
//                 style: GoogleFonts.poppins(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // 🔹 Form
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     _buildTextField(
//                       controller: _nameController,
//                       label: "Full Name",
//                       icon: Icons.person_outline,
//                       validator: (v) =>
//                           v!.isEmpty ? "Enter your name" : null,
//                     ),
//                     const SizedBox(height: 15),

//                     _buildTextField(
//                       controller: _emailController,
//                       label: "Email",
//                       icon: Icons.email_outlined,
//                       validator: (v) =>
//                           v!.isEmpty ? "Enter a valid email" : null,
//                     ),
//                     const SizedBox(height: 15),

//                     _buildTextField(
//                       controller: _phoneController,
//                       label: "Phone Number",
//                       icon: Icons.phone_outlined,
//                       keyboardType: TextInputType.phone,
//                       validator: (v) => v!.length < 10
//                           ? "Enter valid phone number"
//                           : null,
//                     ),
//                     const SizedBox(height: 15),

//                     if (_role == "user")
//                       Column(
//                         children: [
//                           _buildTextField(
//                             controller: _addressController,
//                             label: "Address",
//                             icon: Icons.location_on_outlined,
//                             validator: (v) => v!.isEmpty
//                                 ? "Address is required for users"
//                                 : null,
//                           ),
//                           const SizedBox(height: 15),
//                         ],
//                       ),

//                     _buildTextField(
//                       controller: _passwordController,
//                       label: "Password",
//                       icon: Icons.lock_outline,
//                       isPassword: true,
//                       validator: (v) {
//                         if (v!.length < 8) {
//                           return "Minimum 8 characters";
//                         } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)')
//                             .hasMatch(v)) {
//                           return "Must include upper, lower & number";
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // 🔹 Role Selector
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Radio(
//                           activeColor: themeColor,
//                           value: "user",
//                           groupValue: _role,
//                           onChanged: (v) => setState(() => _role = v.toString()),
//                         ),
//                         Text("User", style: GoogleFonts.poppins(fontSize: 14)),
//                         const SizedBox(width: 20),
//                         Radio(
//                           activeColor: themeColor,
//                           value: "admin",
//                           groupValue: _role,
//                           onChanged: (v) => setState(() => _role = v.toString()),
//                         ),
//                         Text("Admin", style: GoogleFonts.poppins(fontSize: 14)),
//                       ],
//                     ),
//                     const SizedBox(height: 25),

//                     // 🔹 Sign Up Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: _loading ? null : _register,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: themeColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                         ),
//                         child: _loading
//                             ? const CircularProgressIndicator(
//                                 color: Colors.white)
//                             : Text(
//                                 "Sign Up",
//                                 style: GoogleFonts.poppins(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // 🔹 Navigate to Login
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (_) => const LoginPage()),
//                     );
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       style: GoogleFonts.poppins(
//                           color: Colors.black87, fontSize: 14),
//                       children: const [
//                         TextSpan(text: "Already have an account? "),
//                         TextSpan(
//                           text: "Login",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     bool isPassword = false,
//     TextInputType keyboardType = TextInputType.text,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: keyboardType,
//       validator: validator,
//       style: GoogleFonts.poppins(),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: const Color(0xFF004AAD)),
//         labelText: label,
//         labelStyle: GoogleFonts.poppins(color: Colors.grey[700]),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Color(0xFF004AAD), width: 1.5),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  String _role = "user";
  bool _loading = false;

  final Dio _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/api/users"));

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    try {
      final data = {
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "phone_no": _phoneController.text.trim(),
        "password": _passwordController.text.trim(),
        "address": _role == "user" ? _addressController.text.trim() : null,
        "role": _role
      };

      final response = await _dio.post("/register", data: data);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Registration successful! Please login.",
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    } on DioException catch (e) {
      final msg = e.response?.data["message"] ?? "Registration failed!";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg, style: GoogleFonts.poppins(color: Colors.white)),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      setState(() => _loading = false);
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
              child: Column(
                children: [
                  Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign up to get started",
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _nameController,
                          label: "Full Name",
                          icon: Icons.person_outline,
                          validator: (v) =>
                              v!.isEmpty ? "Enter your name" : null,
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: _emailController,
                          label: "Email",
                          icon: Icons.email_outlined,
                          validator: (v) =>
                              v!.isEmpty ? "Enter a valid email" : null,
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: _phoneController,
                          label: "Phone Number",
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          validator: (v) => v!.length < 10
                              ? "Enter valid phone number"
                              : null,
                        ),
                        const SizedBox(height: 15),

                        if (_role == "user")
                          Column(
                            children: [
                              _buildTextField(
                                controller: _addressController,
                                label: "Address",
                                icon: Icons.location_on_outlined,
                                validator: (v) => v!.isEmpty
                                    ? "Address is required for users"
                                    : null,
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),

                        _buildTextField(
                          controller: _passwordController,
                          label: "Password",
                          icon: Icons.lock_outline,
                          isPassword: true,
                          validator: (v) {
                            if (v!.length < 8) {
                              return "Minimum 8 characters";
                            } else if (!RegExp(
                                    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)')
                                .hasMatch(v)) {
                              return "Must include upper, lower & number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // 🔹 Role Selector
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Register as",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _role,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: const [
                                DropdownMenuItem(
                                    value: "user", child: Text("User")),
                                DropdownMenuItem(
                                    value: "admin", child: Text("Admin")),
                              ],
                              onChanged: (value) {
                                setState(() => _role = value!);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // 🔹 Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _loading ? null : _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: _loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : Text(
                                    "Sign Up",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // 🔹 Navigate to Login
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              color: Colors.black87, fontSize: 14),
                          children: const [
                            TextSpan(text: "Already have an account? "),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      style: GoogleFonts.poppins(),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black87),
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
    );
  }
}
