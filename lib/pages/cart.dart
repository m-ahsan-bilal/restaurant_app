import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/utils/my_button.dart';
import 'package:food_delivery_app/utils/my_cart_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final priceTotal = restaurant.getTotalPrice();
      final userCart = restaurant.cart;

      final colorText = Theme.of(context).colorScheme.inversePrimary;

      return Scaffold(
        appBar: AppBar(
          title: const Text('C A R T'),
          leading: IconButton(
            onPressed: () {
              context.go('/home_dash');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Are you sure you want to clear the cart?',
                      style: TextStyle(color: colorText),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(child: Text('Cart is empty..')),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return MyCartTile(
                                cartItem: cartItem,
                                restaurant: restaurant,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
            // Card for displaying totals
            Card(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Use theme color for card
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cart:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          '₨ $priceTotal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charges:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          '₨ $priceTotal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      onTap: () {
                        if (userCart.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'There are no items in your cart, please add some items first!',
                                  style: TextStyle(color: colorText),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      context.go('/home_dash');
                                    },
                                    child: const Text('Go to add items'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (priceTotal < 500) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Minimum order is 500",
                                  style: TextStyle(color: colorText),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          context.go('/checkout');
                        }
                      },
                      title: "Go To Checkout",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    });
  }
}
