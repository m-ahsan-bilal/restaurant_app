import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qasim_milk_shop/models/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank you for your order!"),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayCartReceipt())),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Estimated delivery time is 40 minutes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
