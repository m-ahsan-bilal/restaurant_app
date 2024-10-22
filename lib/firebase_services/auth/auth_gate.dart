import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qasim_milk_shop/firebase_services/auth/login_or_register.dart';
import 'package:qasim_milk_shop/log_register/loginuser.dart';
import 'package:qasim_milk_shop/pages/dashboard.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomeDash();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
