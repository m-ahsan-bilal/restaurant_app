import 'package:flutter/material.dart';
import 'package:food_delivery_app/user/user_provider.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: (context),
        builder: (context) => AlertDialog(
              title: const Text("your location"),
              content: const TextField(
                decoration: InputDecoration(hintText: " Search Adress.."),
              ),
              actions: [
                // cancel buttton

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"),
                ),

                // save buttton
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("save"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    String? location = Provider.of<UserProvider>(context).location;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deliver now!",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            openLocationSearchBox(context);
          },
          child: Row(
            children: [
              // adress
              Text(
                location ?? "",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              // drop down
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ],
    );
  }
}
