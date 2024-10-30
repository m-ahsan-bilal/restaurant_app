import 'package:flutter/material.dart';
import 'package:food_delivery_app/admin/admin_dashboard.dart';
import 'package:food_delivery_app/user/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchAllUsers(); // Fetch all users on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - User List'),
        leading: IconButton(
            onPressed: () {
              context.go('/admin_dashboard');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.allUsers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: userProvider.allUsers.length,
            itemBuilder: (context, index) {
              final user = userProvider.allUsers[index];
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(user['name'] ?? 'N/A'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${user['phoneNumber'] ?? 'N/A'}'),
                    Text('Location: ${user['location'] ?? 'N/A'}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
