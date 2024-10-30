import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream that combines orders and user data
  Stream<List<Map<String, dynamic>>> getOrdersWithUserDataStream() async* {
    await for (var orderSnapshot in _firestore
        .collection('orders')
        .orderBy('data', descending: true) // Order by date in descending order
        .snapshots()) {
      List<Map<String, dynamic>> ordersWithUserData = [];

      List<Future<void>> futures = [];

      for (var orderDoc in orderSnapshot.docs) {
        var orderData = orderDoc.data();
        var userId = orderData['userId'] as String?;

        futures.add(
            _firestore.collection('users').doc(userId).get().then((userDoc) {
          if (userDoc.exists) {
            var userData = userDoc.data()!;
            ordersWithUserData.add({
              ...orderData,
              'userName': userData['name'] ?? 'Unknown',
              'phoneNumber': userData['phoneNumber'] ?? 'Unknown',
              'location': userData['location'] ?? 'Unknown',
            });
          } else {
            ordersWithUserData.add({
              ...orderData,
              'userName': 'Unknown',
              'phoneNumber': 'Unknown',
              'location': 'Unknown',
            });
          }
        }));
      }

      await Future.wait(futures);
      yield ordersWithUserData;
    }
  }
}
