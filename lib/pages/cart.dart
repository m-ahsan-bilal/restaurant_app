import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qasim_milk_shop/models/restaurant.dart';
import 'package:qasim_milk_shop/utils/my_button.dart';
import 'package:qasim_milk_shop/utils/my_cart_tile.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      // Scaffolf UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('C A R T'),
          leading: IconButton(
              onPressed: () {
                context.go('/home_dash');
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          ' Are your sure you want to clear the cart?'),
                      actions: [
                        // cancel button
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),

                        //yes buttonn

                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text('yes')),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete_outline))
          ],
        ),
        body: Column(
          children: [
            // list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(child: Text('Cart is empty..')))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final cartItem = userCart[index];
                                // return
                                return MyCartTile(
                                  cartItem: cartItem,
                                  restaurant: restaurant,
                                );
                              }),
                        ),
                ],
              ),
            ),
            // button to checkout
            MyButton(
                onTap: () {
                  context.go('/checkout');
                },
                title: "Go To Checkout"),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      );
    });
  }
}
