import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P R O F I L E'),
        leading: IconButton(
            onPressed: () {
              context.go('/day_18');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
