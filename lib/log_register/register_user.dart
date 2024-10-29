// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qasim_milk_shop/firebase_services/auth/auth_services.dart';
// import 'package:qasim_milk_shop/utils/dialoge.dart';
// import 'package:qasim_milk_shop/utils/my_button.dart';
// import 'package:qasim_milk_shop/utils/my_text_field.dart';

// class RegisterUser extends StatefulWidget {
//   const RegisterUser({super.key});

//   @override
//   State<RegisterUser> createState() => _RegisterUserState();
// }

// class _RegisterUserState extends State<RegisterUser> {
//   final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

//   // obscure text
//   bool _obscureText = true;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   final emailFocus = FocusNode();
//   final passwordFocus = FocusNode();
//   final confirmPasswrodFocus = FocusNode();
//   final _formKey = GlobalKey<FormState>();

//   // text editing controller
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   Future<void> signUp() async {
//     final _authService = AuthService();
//     // check if passwords matcch create user
//     if (passwordController.text.trim() ==
//         confirmPasswordController.text.trim()) {
//       // try creating user
//       try {
//         await _authService.signUpWithEmailPassword(
//             emailController.text.trim(), passwordController.text.trim());
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: const Text(
//                     "Congratulations!, You are registered..",
//                     style: TextStyle(color: Colors.black87),
//                   ),
//                   titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
//                   actions: [
//                     TextButton(
//                         onPressed: () => context.go('/login_user'),
//                         child: const Text(
//                           "Login Now!",
//                           style: TextStyle(color: Colors.black87),
//                         ))
//                   ],
//                 ));
//         // context.go("/login_user");
//       }
//       // display any errors
//       catch (e) {
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: Text(e.toString()),
//                 ));
//       }
//     }

//     // if passwords don't match
//     else {
//       showDialog(
//           context: context,
//           builder: (context) => const AlertDialog(
//                 title: Text("Passwords don't match"),
//               ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(
//                 "assets/images/dairy_milk1.jpg",
//                 width: double.infinity,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 "Let's Create An Account For You!",
//                 style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                     fontSize: 15),
//               ),
//               const SizedBox(height: 25),

//               // Email TextField
//               MyTextField(
//                 focusNode: emailFocus,
//                 controller: emailController,
//                 hintText: "Email",
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!regex.hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(passwordFocus);
//                 },
//               ),
//               const SizedBox(height: 20),

//               // Password TextField
//               MyTextField(
//                 focusNode: passwordFocus,
//                 controller: passwordController,
//                 hintText: 'Password',
//                 obscureText: _obscureText,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(confirmPasswrodFocus);
//                 },
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _obscureText ? Icons.visibility_off : Icons.visibility,
//                   ),
//                   onPressed: _togglePasswordVisibility,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Confirm Password TextField
//               MyTextField(
//                 focusNode: confirmPasswrodFocus,
//                 controller: confirmPasswordController,
//                 hintText: 'Confirm Password',
//                 obscureText: _obscureText,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your password';
//                   }
//                   if (value != passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _obscureText ? Icons.visibility_off : Icons.visibility,
//                   ),
//                   onPressed: _togglePasswordVisibility,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Sign Up Button
//               MyButton(
//                 onTap: () {
//                   if (_formKey.currentState!.validate()) {
//                     String email = emailController.text.trim();
//                     String password = passwordController.text.trim();
//                     String confirmPassword =
//                         confirmPasswordController.text.trim();

//                     debugPrint(
//                         'Email: $email, Password: $password, Confirm Password: $confirmPassword');
//                     signUp();
//                   }
//                 },
//                 title: "Sign Up",
//               ),
//               // Already Have Account
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already Have An Account?',
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary),
//                     ),
//                     const SizedBox(width: 4),
//                     InkWell(
//                       onTap: () {
//                         context.go('/login_user');
//                       },
//                       child: Text(
//                         'Login Now!',
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.inversePrimary,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_services/auth/auth_services.dart';
import 'package:food_delivery_app/firebase_services/database/user_services.dart';
import 'package:food_delivery_app/utils/my_button.dart';
import 'package:food_delivery_app/utils/my_text_field.dart';
import 'package:go_router/go_router.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  // Obscure text
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final locationFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final _authService = AuthService();
    final _userService = UserService(); // Create an instance of UserService

    // Check if passwords match and create user
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      try {
        // Create user and get UserCredential
        UserCredential userCredential =
            await _authService.signUpWithEmailPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        // Get user ID from UserCredential
        String userId = userCredential.user!.uid; // Extract the user ID

        // Prepare user data to be saved in Firestore
        Map<String, dynamic> userData = {
          'email': emailController.text.trim(),
          'name': nameController.text.trim(),
          'phoneNumber': phoneController.text.trim(),
          'location': locationController.text.trim(),
        };

        // Save user details in Firestore
        await _userService.createUser(userId, userData);

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Congratulations! You are registered.",
              style: TextStyle(color: Colors.black87),
            ),
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            actions: [
              TextButton(
                onPressed: () => context.go('/login_user'),
                child: const Text(
                  "Login Now!",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/mainpage.jpeg",
                width: double.infinity,
              ),
              const SizedBox(height: 30),
              Text(
                "Let's Create An Account For You!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 25),

              // Name TextField
              MyTextField(
                focusNode: nameFocus,
                controller: nameController,
                hintText: "Name",
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(phoneFocus);
                },
              ),
              const SizedBox(height: 20),

              // Phone Number TextField
              MyTextField(
                focusNode: phoneFocus,
                controller: phoneController,
                hintText: "Phone Number",
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(locationFocus);
                },
              ),
              const SizedBox(height: 20),

              // Location TextField
              MyTextField(
                focusNode: locationFocus,
                controller: locationController,
                hintText: "Location",
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(height: 20),

              // Email TextField
              MyTextField(
                focusNode: emailFocus,
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),
              const SizedBox(height: 20),

              // Password TextField
              MyTextField(
                focusNode: passwordFocus,
                controller: passwordController,
                hintText: 'Password',
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmPasswordFocus);
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password TextField
              MyTextField(
                focusNode: confirmPasswordFocus,
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up Button
              MyButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    signUp();
                  }
                },
                title: "Sign Up",
              ),

              // Already Have Account
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have An Account?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        context.go('/login_user');
                      },
                      child: Text(
                        'Login Now!',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
