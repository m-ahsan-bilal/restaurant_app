// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qasim_milk_shop/firebase_services/auth_services.dart';
// import 'package:qasim_milk_shop/utils/dialoge.dart';
// import 'package:qasim_milk_shop/utils/my_button.dart';
// import 'package:qasim_milk_shop/utils/my_text_field.dart';

// class LoginUser extends StatefulWidget {
//   final void Function()? onTap;

//   const LoginUser({super.key, required this.onTap});

//   @override
//   State<LoginUser> createState() => _LoginUserState();
// }

// class _LoginUserState extends State<LoginUser>
//     with SingleTickerProviderStateMixin {
//   final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//   bool _obscureText = true;
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _scaleAnimation =
//         Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _opacityAnimation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     ));

//     _controller.forward(); // Start the animation
//   }

//   // Toggle password visibility
//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   final emailFocus = FocusNode();
//   final passwordFocus = FocusNode();
//   final _formKey = GlobalKey<FormState>();

//   // Text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   // Login method
//   Future<void> login() async {
//     // get instance of auth service

//     final _authService = AuthService();
//     // try sign in
//     try {
//       await _authService.signInWithEmailPassword(
//           emailController.text.trim(), passwordController.text.trim());
//       debugPrint("User login with that email: ${emailController.text.trim()}");
//       context.go('/home_dash');

//       // catch any errors and display them
//     } catch (e) {
//       showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: Text(e.toString()),
//               ));
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: ScaleTransition(
//             scale: _scaleAnimation,
//             child: FadeTransition(
//               opacity: _opacityAnimation,
//               child: Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     "assets/images/dairy_milk1.jpg",
//                     width: double.infinity,
//                   ),
//                   const SizedBox(height: 30),

//                   Text(
//                     "Q A S I M  M I L K  S H O P",
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontSize: 25, // Increased font size
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "FRESH, PURE, EVERYDAY!",
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Welcome back, You have been missed!",
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontSize: 18),
//                   ),
//                   const SizedBox(height: 25),

//                   MyTextField(
//                     focusNode: emailFocus,
//                     controller: emailController,
//                     hintText: "Email",
//                     obscureText: false,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!regex.hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                     onFieldSubmitted: (_) {
//                       FocusScope.of(context).requestFocus(passwordFocus);
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   // Password text field
//                   MyTextField(
//                     focusNode: passwordFocus,
//                     controller: passwordController,
//                     hintText: 'Password',
//                     obscureText: _obscureText,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                     onFieldSubmitted: (_) {
//                       FocusScope.of(context).unfocus();
//                     },
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility_off : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         _togglePasswordVisibility();
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Forgot Password?',
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary),
//                     textAlign: TextAlign.start,
//                   ),
//                   const SizedBox(height: 30),
//                   MyButton(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         login();
//                       }
//                     },
//                     title: "Sign In",
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Not A Member?',
//                         style: TextStyle(
//                             color:
//                                 Theme.of(context).colorScheme.inversePrimary),
//                       ),
//                       const SizedBox(width: 4),
//                       InkWell(
//                         onTap: () => context.go('/register_user'),
//                         child: Text(
//                           'Register Now!',
//                           style: TextStyle(
//                               color:
//                                   Theme.of(context).colorScheme.inversePrimary,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_services/auth/auth_services.dart';
import 'package:food_delivery_app/utils/my_button.dart';
import 'package:food_delivery_app/utils/my_text_field.dart';
import 'package:go_router/go_router.dart';

class LoginUser extends StatefulWidget {
  final void Function()? onTap;

  const LoginUser({super.key, required this.onTap});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser>
    with SingleTickerProviderStateMixin {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  bool _obscureText = true;
  bool _isSigningIn = false; // New variable to track signing in state
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initializing the AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Scale animation from 0.8 to 1.0
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Opacity animation from 0.0 to 1.0
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animations
    _controller.forward();
  }

  // Toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login method

  // Login method
  Future<void> login() async {
    final _authService = AuthService();

    setState(() {
      _isSigningIn = true; // Show "Signing In..." text
    });

    try {
      // Sign in the user
      await _authService.signInWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Get the currently logged-in user's email
      final currentUser = _authService.getCurrentUser();

      if (currentUser != null) {
        String email = currentUser.email ?? '';

        // Check if the email is the admin's email
        if (email == "admin@qasimmilkshop.com") {
          // Navigate to the AdminDashboard
          context.go('/admin_dashboard');
        } else {
          // Navigate to the regular user dashboard
          context.go('/home_dash');
        }
      }
    } catch (e) {
      // Show error dialog if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    } finally {
      setState(() {
        _isSigningIn = false; // Revert to original text after login attempt
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/mainpage.jpeg",
                    width: double.infinity,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "R E S T A U R A N T  A P P",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // Text(
                  //   "FRESH, PURE, EVERYDAY!",
                  //   style: TextStyle(
                  //     color: Theme.of(context).colorScheme.inversePrimary,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome back, You have been missed!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 25),
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
                  // Text(
                  //   'Forgot Password?',
                  //   style: TextStyle(
                  //     color: Theme.of(context).colorScheme.inversePrimary,
                  //   ),
                  //   textAlign: TextAlign.start,
                  // ),
                  // const SizedBox(height: 30),
                  MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        login(); // Trigger login and change button text
                      }
                    },
                    title: _isSigningIn
                        ? "Signing In..."
                        : "Sign In", // Change text based on login state
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not A Member?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () => context.go('/register_user'),
                        child: Text(
                          'Register Now!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
