import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // save order to database
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      "data": DateTime.now(),
      "order": receipt,
      // add more fields ass necessary
    });
  }
}
