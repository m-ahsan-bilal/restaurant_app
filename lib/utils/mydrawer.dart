// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/firebase_services/auth/auth_services.dart';
// import 'package:food_delivery_app/utils/mydrawertile.dart';
// import 'package:go_router/go_router.dart';

// class Mydrawer extends StatelessWidget {
//   const Mydrawer({super.key});
//   void logout() {
//     final _authService = AuthService();
//     _authService.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       child: Column(
//         children: [
//           // app logo
//           Padding(
//               padding: const EdgeInsets.only(top: 100),
//               child: Image.asset('assets/icons/foricon-6.png')
//               //  Icon(
//               //   Icons.lock_open,
//               //   size: 80,
//               //   color: Theme.of(context).colorScheme.inversePrimary,
//               // ),
//               ),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Divider(
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),

//           // show user id in this tile
//           MyDrawerTile(text: ""),
//           MyDrawerTile(
//             text: "H O M E",
//             icon: Icons.home,
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           MyDrawerTile(
//               text: "S E T T I N G S",
//               icon: Icons.settings,
//               onTap: () {
//                 Navigator.pop(context);
//                 context.go('/settings');
//                 // MaterialPageRoute(builder: )
//               }),
//           const Spacer(),
//           MyDrawerTile(
//             text: "L O G  O U T",
//             icon: Icons.logout_outlined,
//             onTap: () async {
//               Navigator.pop(context);
//               logout;
//               debugPrint("user log out ");
//               context.go('/login_user');
//             },
//           ),
//           const SizedBox(
//             height: 25,
//           ),

//           // home list tile

//           // settings list tile

//           // log ou list tile
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_services/auth/auth_services.dart';
import 'package:food_delivery_app/user/user_provider.dart';
import 'package:food_delivery_app/utils/mydrawertile.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import provider

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  void logout() {
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset('assets/icons/foricon-6.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Show user ID in this tile
          // Consumer<UserProvider>(builder: (context, userProvider, child) {
          //   final userID = context.read<UserProvider>().getUserId();
          //   return MyDrawerTile(
          //     text: "User ID: ${userID ?? 'Not signed in'}",
          //     icon: Icons.account_circle,
          //   );
          // }),

          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              context.go('/settings');
            },
          ),
          // const Spacer(),
          MyDrawerTile(
            text: "L O G  O U T",
            icon: Icons.logout_outlined,
            onTap: () async {
              Navigator.pop(context);
              logout();
              debugPrint("user log out ");
              context.go('/login_user');
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
