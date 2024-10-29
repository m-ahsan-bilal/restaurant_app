import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  String? userName;
  String? location;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    final currentUser = getCurrentUser();
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users') // Change to your users collection name
          .doc(currentUser.uid) // Use the current user's ID
          .get();

      if (snapshot.exists) {
        userName =
            snapshot['name']; // Ensure 'name' matches your Firestore field
        location = snapshot[
            'location']; // Ensure 'location' matches your Firestore field
        notifyListeners(); // Notify listeners to update the UI
      } else {
        print('User document does not exist');
      }
    } else {
      print('No user is currently signed in');
    }
  }
}
