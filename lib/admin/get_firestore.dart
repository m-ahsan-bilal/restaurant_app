// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrderService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Stream<QuerySnapshot> getOrdersStream() {
//     return _firestore
//         .collection('orders')
//         .orderBy('data') // Ensure this is the field that stores the order date
//         .snapshots();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to get orders along with user data
  Stream<List<Map<String, dynamic>>> getOrdersWithUserDataStream() {
    return _firestore
        .collection('orders')
        .snapshots()
        .asyncMap((orderSnapshot) async {
      List<Map<String, dynamic>> ordersWithUsers = [];

      for (var orderDoc in orderSnapshot.docs) {
        var orderData = orderDoc.data();
        var userId = orderData['userId'];
        var userDoc = await _firestore.collection('users').doc(userId).get();

        if (userDoc.exists) {
          var userData = userDoc.data();
          ordersWithUsers.add({
            'order': orderData,
            'user': userData,
          });
        }
      }
      return ordersWithUsers;
    });
  }

  // Stream<List<Map<String, dynamic>>> getOrdersWithUserDataStream() {
  //   return _firestore
  //       .collection('orders')
  //       .snapshots()
  //       .asyncMap((orderSnapshot) async {
  //     List<Map<String, dynamic>> ordersWithUsers = [];

  //     for (var orderDoc in orderSnapshot.docs) {
  //       // Get order data
  //       var orderData = orderDoc.data();

  //       // Fetch user data based on userId stored in the order
  //       var userId = orderData['userId'];
  //       var userDoc = await _firestore.collection('users').doc(userId).get();

  //       // Combine order data and user data
  //       if (userDoc.exists) {
  //         var userData = userDoc.data();
  //         ordersWithUsers.add({
  //           'order': orderData,
  //           'user': userData,
  //         });
  //       }
  //     }
  //     return ordersWithUsers; // Return the combined list
  //   });
  // }
}
