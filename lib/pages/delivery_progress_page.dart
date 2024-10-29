import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_services/database/firestore.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/utils/my_receipt.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreServices db = FirestoreServices();
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    saveOrder();
  }

  Future<void> saveOrder() async {
    setState(() {
      isLoading = true;
      errorMessage = null; // Reset error message
    });

    try {
      String receipt = context.read<Restaurant>().displayCartReceipt();
      await db.saveOrderToDatabase(receipt);
    } catch (e) {
      setState(() {
        errorMessage = "Failed to save order: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/checkout');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Delivery In Progress..."),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(child: const CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(errorMessage!,
                          style: const TextStyle(color: Colors.red)),
                    ),
                  const MyReceipt(),
                ],
              ),
            ),
    );
  }
}























// class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
//   // get access to database
//   FirestoreServices db = FirestoreServices();
//   @override
//   void initState() {
//     super.initState();

//     // if we get to this page, get to the database
//     String receipt = context.read<Restaurant>().displayCartReceipt();
//     db.saveOrderToDatabase(receipt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             context.go('/checkout');
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         title: const Text("Delivery In Progress..."),
//         // backgroundColor: Theme.of(context).colorScheme.,
//         backgroundColor: Colors.transparent,
//       ),
//       // bottomNavigationBar: _bottomNavigationBar(context),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MyReceipt(),
//           ],
//         ),
//       ),
//     );
//   }
// }


