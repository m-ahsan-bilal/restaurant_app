import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/utils/my_quantity.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  final Restaurant restaurant;
  const MyCartTile(
      {super.key, required this.cartItem, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // food name
                            Text(cartItem.food.name),

                            // fiood price
                            Text("Rs.${cartItem.food.price.toString().trim()}")
                          ],
                        ),
                        const Spacer(),

                        // increments or decrement quantity
                        MyQuantitySelector(
                            quantity: cartItem.quantity,
                            food: cartItem.food,
                            onIncrement: () {
                              restaurant.addToCart(
                                  cartItem.food, cartItem.selectedAddons);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            }),
                      ],
                    ),
                  ),

                  // addons
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                          right: 10,
                        ),
                        children: cartItem.selectedAddons
                            .map(
                              (addon) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: FilterChip(
                                  label: Row(children: [
                                    // addon name
                                    Text(addon.name),
                                    // addon price
                                    Text(
                                      "Rs. ${addon.price}",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ]),
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                ),
                              ),
                            )
                            .toList()),
                  )
                ],
              ),
            ));
  }
}
