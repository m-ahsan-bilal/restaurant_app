// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> createUser(String userId, Map<String, dynamic> userData) async {
//     await _firestore.collection('users').doc(userId).set(userData);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String userId, Map<String, dynamic> userData) async {
    // Get the current timestamp from Firestore
    FieldValue now = FieldValue.serverTimestamp();

    // Add created_at and updated_at timestamps to userData
    userData['created_at'] = now;
    userData['updated_at'] = now;

    // Save the user data in Firestore under the 'users' collection
    await _firestore.collection('users').doc(userId).set(userData);
  }

  // Method to get user data by user ID
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
