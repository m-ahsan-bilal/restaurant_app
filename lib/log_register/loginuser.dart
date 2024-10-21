import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/utils/my_button.dart';
import 'package:qasim_milk_shop/utils/my_text_field.dart';
import 'package:qasim_milk_shop/utils/square_tile.dart';

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
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward(); // Start the animation
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
  void login() {
    /*
    We will do here the authentication
    */
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _controller.dispose();
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
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/dairy_milk1.jpg",
                    width: double.infinity,
                  ),
                  const SizedBox(height: 30),

                  Text(
                    "Q A S I M  M I L K  S H O P",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 25, // Increased font size
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "FRESH, PURE, EVERYDAY!",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome back, You have been missed!",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 18),
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

                  // Password text field
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
                      onPressed: () {
                        _togglePasswordVisibility();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 30),
                  MyButton(
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      context.go('/home_dash');
                      // Uncomment the login method when ready
                      // login();
                      // }
                    },
                    title: "Sign In",
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not A Member?',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () => context.go('/register_user'),
                        child: Text(
                          'Register Now!',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold),
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
