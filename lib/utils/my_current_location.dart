import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});
  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: (context),
        builder: (context) => AlertDialog(
              title: const Text("Your Location"),
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
                "9D Gol Bagh",
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
