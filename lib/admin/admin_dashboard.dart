// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:qasim_milk_shop/firebase_services/auth/auth_services.dart';

// class AdminDashboard extends StatefulWidget {
//   const AdminDashboard({super.key});

//   @override
//   State<AdminDashboard> createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   void logout() {
//     final _authService = AuthService();
//     _authService.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () async {
//               logout();
//               debugPrint("User logged out");
//               context.go('/login_user');
//             },
//             icon: Icon(Icons.logout_sharp)),
//         title: const Text(
//           "Admin Dashboard",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 1,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             _buildDashboardCard(
//               context,
//               icon: Icons.delivery_dining,
//               title: 'Manage Orders',
//               subtitle: 'View orders and track orders',
//               color: Colors.orangeAccent,
//               onTap: () {
//                 context.go('/view_orders'); // Navigate to 'View Orders' screen
//                 debugPrint('Navigating to orders screen');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDashboardCard(BuildContext context,
//       {required IconData icon,
//       required VoidCallback onTap,
//       required String title,
//       required String subtitle,
//       required Color color}) {
//     return Container(
//       height: 1100,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 5,
//         color: color.withOpacity(0.1),
//         child: InkWell(
//           onTap: onTap, // Correct onTap
//           borderRadius: BorderRadius.circular(12),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   icon,
//                   size: 40,
//                   color: color,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   title,
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: color,
//                       ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   subtitle,
//                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         color: Colors.black54,
//                       ),
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
import 'package:food_delivery_app/firebase_services/auth/auth_services.dart';
import 'package:go_router/go_router.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool isLoggingOut = false;

  void logout() async {
    setState(() {
      isLoggingOut = true; // Show loading state
    });

    final _authService = AuthService();
    await _authService.signOut();

    setState(() {
      isLoggingOut = false; // Reset loading state
    });

    debugPrint("User logged out");
    context.go('/login_user');
  }

  Future<void> _confirmLogout() async {
    final colorText = Theme.of(context).colorScheme.inversePrimary;
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: colorText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              logout(); // Call logout if confirmed
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    // If the user confirmed the logout, proceed to logout
    if (shouldLogout == true) {
      logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: _confirmLogout, // Confirm logout
          icon: const Icon(Icons.logout_sharp),
        ),
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              context,
              icon: Icons.delivery_dining,
              title: 'Manage Orders',
              subtitle: 'View orders and track orders',
              color: Colors.orangeAccent,
              onTap: () {
                context.go('/view_orders'); // Navigate to 'View Orders' screen
                debugPrint('Navigating to orders screen');
              },
            ),
            // Additional cards can be added here
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon,
      required VoidCallback onTap,
      required String title,
      required String subtitle,
      required Color color}) {
    return Container(
      height: 110, // Adjust the height based on the content
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        color: color.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
