import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/utils/dialoge.dart';
import 'package:qasim_milk_shop/utils/my_button.dart';
import 'package:qasim_milk_shop/utils/my_text_field.dart';
import 'package:qasim_milk_shop/utils/square_tile.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  // obscure text
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswrodFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
                "assets/images/dairy_milk1.jpg",
                width: double.infinity,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Let's Create An Account For You!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15),
              ),
              const SizedBox(height: 25),

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
                  FocusScope.of(context).requestFocus(confirmPasswrodFocus);
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
                focusNode: confirmPasswrodFocus,
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
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword =
                        confirmPasswordController.text.trim();

                    debugPrint(
                        'Email: $email, Password: $password, Confirm Password: $confirmPassword');

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SuccessDialog(
                            message: "Validation successful!");
                      },
                    );
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
                          color: Theme.of(context).colorScheme.inversePrimary),
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
                            fontWeight: FontWeight.bold),
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
