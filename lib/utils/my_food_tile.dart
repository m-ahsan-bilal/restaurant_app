// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/models/food.dart';

// class MyFoodTile extends StatelessWidget {
//   final Food food;
//   final void Function()? onTap;
//   const MyFoodTile({super.key, required this.onTap, required this.food});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               children: [
//                 // text food details
//                 Expanded(
//                     child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       food.name,
//                     ),
//                     Text(
//                       "Rs.${food.price}",
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       food.description,
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary),
//                     ),
//                   ],
//                 )),
//                 const SizedBox(
//                   width: 15,
//                 ), // borderRadius:
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     food.imagePath,
//                     height: 120,
//                   ),
//                 ),
//                 Divider(
//                   color: Theme.of(context).colorScheme.tertiary,
//                   endIndent: 25,
//                   indent: 25,
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const MyFoodTile({super.key, required this.onTap, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 15.0), // Reduced padding
            child: Row(
              children: [
                // Text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "Rs.${food.price}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Reduced height between elements
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 10), // Reduced width between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 80, // Reduced image height for a more compact look
                    width: 80, // Added width to keep image square
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 15,
          endIndent: 15,
          thickness: 1, // Slightly thicker divider for better separation
        ),
      ],
    );
  }
}
