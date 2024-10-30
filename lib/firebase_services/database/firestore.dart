import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // Get the collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // Save order to database with userId
  Future<void> saveOrderToDatabase(String receipt, String userId) async {
    await orders.add({
      "data": DateTime.now(),
      "order": receipt,
      "userId": userId, // Add userId to link the order to a specific user
      // Add more fields as necessary
    });
  }
}
