import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/user/user_provider.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final locationController = TextEditingController();
  bool isLoading = false;

  void openLocationSearchBox(BuildContext context) {
    final colorText = Theme.of(context).colorScheme.inversePrimary;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add new location",
          style: TextStyle(color: colorText),
        ),
        content: TextField(
          controller: locationController,
          decoration:
              const InputDecoration(hintText: "Write your location here"),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final newLocation = locationController.text.trim();
              if (newLocation.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });
                await Provider.of<UserProvider>(context, listen: false)
                    .updateUserLocation(newLocation);
                setState(() {
                  isLoading = false;
                });
              }
              Navigator.pop(context);
            },
            child:
                // isLoading
                //     ? Container(
                //         height: 18,
                //         width: 18,
                //         color: Colors.amberAccent,
                //         child: CircularProgressIndicator(strokeWidth: 4),
                //       )
                // :
                const Text("Save"),
          ),
        ],
      ),
    );
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
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            openLocationSearchBox(context);
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  location ?? "Set your location",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  maxLines: 1, // Limit to 1 line
                  overflow: TextOverflow.ellipsis, // Show "..." if too long
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
