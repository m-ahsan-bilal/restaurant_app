// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserProvider extends ChangeNotifier {
//   String? userName;
//   String? location;
//   String? phoneNumber;

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   // Get the current user
//   User? getCurrentUser() {
//     return _firebaseAuth.currentUser;
//   }

//   // Fetch user data from Firestore
//   Future<void> fetchUserData() async {
//     final currentUser = getCurrentUser();
//     if (currentUser != null) {
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.uid) // Use the current user's ID
//           .get();

//       if (snapshot.exists) {
//         userName = snapshot['name'];
//         location = snapshot['location'];
//         phoneNumber = snapshot['phoneNumber'];
//         debugPrint('got user data');

//         notifyListeners();
//       } else {
//         print('User document does not exist');
//       }
//     } else {
//       print('No user is currently signed in');
//     }
//   }

//   // update the user's location

//   Future<void> updateUserLocation(String newLocation) async {
//     final currentUser =
//         getCurrentUser(); // Assuming this gets the current Firebase user
//     if (currentUser != null) {
//       try {
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(currentUser.uid) // Use the current user's ID
//             .update({'location': newLocation}); // Update the location field

//         location = newLocation; // Update the local variable
//         notifyListeners(); // Notify listeners to update the UI if necessary

//         debugPrint('User location updated successfully');
//       } catch (e) {
//         debugPrint('Failed to update location: $e');
//       }
//     } else {
//       debugPrint('No user is currently signed in');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  String? userName;
  String? location;
  String? phoneNumber;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Method to get user ID
  String? getUserId() {
    return _firebaseAuth.currentUser?.uid; // Returns user ID
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid) // Use the current user's ID
          .get();

      if (snapshot.exists) {
        userName = snapshot['name'];
        location = snapshot['location'];
        phoneNumber = snapshot['phoneNumber'];
        debugPrint('got user data');

        notifyListeners();
      } else {
        print('User document does not exist');
      }
    } else {
      print('No user is currently signed in');
    }
  }

  // Update the user's location
  Future<void> updateUserLocation(String newLocation) async {
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({'location': newLocation}); // Update the location field

        location = newLocation; // Update the local variable
        notifyListeners(); // Notify listeners to update the UI if necessary

        debugPrint('User location updated successfully');
      } catch (e) {
        debugPrint('Failed to update location: $e');
      }
    } else {
      debugPrint('No user is currently signed in');
    }
  }

  // fetch all users to show to admin
  List<Map<String, dynamic>> allUsers = []; // Store all users' data

  // Fetch all users' data from Firestore
  Future<void> fetchAllUsers() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      allUsers = snapshot.docs.map((doc) {
        return {
          'userId': doc.id,
          'name': doc['name'] ?? 'Unknown',
          'location': doc['location'] ?? 'Unknown',
          'phoneNumber': doc['phoneNumber'] ?? 'Unknown',
        };
      }).toList();

      notifyListeners(); // Notify listeners to update the UI
    } catch (e) {
      debugPrint('Failed to fetch users: $e');
    }
  }
}
