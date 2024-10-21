import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:qasim_milk_shop/utils/my_button.dart';

class Day18 extends StatelessWidget {
  const Day18({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Q A S I M  M I L K  S H O P',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          MyButton(
            title: "L 0 G I N",
            onTap: () {
              context.go('/login_user');
            },
          ),
          const SizedBox(
            height: 100,
          ),
          MyButton(
            title: "D A S H B O A R D",
            onTap: () {
              context.go('/dashboard');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            title: "S H O P",
            onTap: () {
              context.go('/shop_view');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            title: "C A R T",
            onTap: () {
              context.go('/cart_view');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            title: "U S E R",
            onTap: () {
              context.go('/user_view');
            },
          )
          // ElevatedButton(
          //     onPressed: () {
          //       context.go('/dashboard');
          //     },
          //     child: child)
        ],
      )),
    );
  }
}
