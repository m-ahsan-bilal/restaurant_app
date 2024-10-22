import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qasim_milk_shop/firebase_services/database/firestore.dart';
import 'package:qasim_milk_shop/models/restaurant.dart';
import 'package:qasim_milk_shop/utils/my_receipt.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  // get access to database
  FirestoreServices db = FirestoreServices();
  @override
  void initState() {
    super.initState();

    // if we get to this page, get to the database
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
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
        // backgroundColor: Theme.of(context).colorScheme.,
        backgroundColor: Colors.transparent,
      ),
      // bottomNavigationBar: _bottomNavigationBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }

  // // CUstom Bottom nav bar - message / call delivery driver
  // Widget _bottomNavigationBar(BuildContext context) {
  //   return Container(
  //     height: 100,
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.secondary,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(40),
  //         topRight: Radius.circular(40),
  //       ),
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //               color: Theme.of(context).colorScheme.surface,
  //               shape: BoxShape.circle),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
