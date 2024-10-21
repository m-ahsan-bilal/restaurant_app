import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qasim_milk_shop/models/cart_item.dart';
import 'package:qasim_milk_shop/models/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Milk Category
    Food(
      category: FoodCategory.Milk,
      name: "Pure Milk",
      description: "Pure organic milk",
      imagePath: "assets/images/milk_1.png",
      price: 270,
      availableAddons: [
        Addon(name: "Fresh Milk", price: 200),
        Addon(name: "Dahi Bhallay", price: 150),
        Addon(name: "Ras Malai", price: 180),
      ],
    ),

    Food(
      category: FoodCategory.Milk,
      name: "Fresh Milk",
      description: "Good quality fresh milk",
      imagePath: "assets/images/milk_2.png",
      price: 200,
      availableAddons: [
        Addon(name: "Barfi", price: 100),
        Addon(name: "Ras Malai", price: 180),
      ],
    ),

    // Sides Category
    Food(
      category: FoodCategory.Sides,
      name: "Dahi Bhallay",
      description: "Special fresh dahi bhallay full of spice",
      imagePath: "assets/images/dahi_bhallay.jpg",
      price: 150,
      availableAddons: [
        Addon(name: "Barfi", price: 120),
        Addon(name: "faluda", price: 150),
      ],
    ),

    // Desserts Category
    Food(
      category: FoodCategory.Desserts,
      name: "Ras Malai",
      description: "Creamy and delicious Ras Malai",
      imagePath: "assets/images/ras_malai.jpg",
      price: 180,
      availableAddons: [
        Addon(name: "Barfi", price: 120),
        Addon(name: "Faluda", price: 220),
      ],
    ),

    Food(
      category: FoodCategory.Desserts,
      name: "Khoya",
      description: "Rich and sweet khoya",
      imagePath: "assets/images/khoya2.jpg",
      price: 150,
      availableAddons: [
        Addon(name: "Dahi Bhallay", price: 150),
        Addon(name: "Meetha Dhoodh", price: 200),
      ],
    ),

    Food(
      category: FoodCategory.Desserts,
      name: "Barfi",
      description: "Delicious traditional Barfi",
      imagePath: "assets/images/barfi1.jpg",
      price: 120,
      availableAddons: [
        Addon(name: "Ras Malai", price: 180),
        Addon(name: "Khoya", price: 150),
      ],
    ),
    Food(
      category: FoodCategory.Desserts,
      name: "Meetha Dahi",
      description: "Delicious traditional and fresh yogurt",
      imagePath: "assets/images/dahi.jpg",
      price: 230,
      availableAddons: [
        Addon(name: "Ras Malai", price: 180),
        Addon(name: "Khoya", price: 150),
      ],
    ),

    // Drinks Category
    Food(
      category: FoodCategory.Drinks,
      name: "Meetha Dhoodh",
      description: "Sweetened milk with a hint of cardamom",
      imagePath: "assets/images/meetha_dhoodh.png",
      price: 200,
      availableAddons: [
        Addon(name: "Faluda", price: 220),
        Addon(name: "Pure Milk", price: 270),
      ],
    ),

    Food(
      category: FoodCategory.Drinks,
      name: "Raabri Wala Dhoodh",
      description: "Refreshing Faluda with vermicelli and jelly",
      imagePath: "assets/images/falooda1.jpg",
      price: 150,
      availableAddons: [
        Addon(name: "Meetha Dhoodh", price: 200),
        Addon(name: "Fresh Milk", price: 200),
      ],
    ),
    Food(
      category: FoodCategory.Drinks,
      name: "Faluda",
      description: "Refreshing Faluda with vermicelli and jelly",
      imagePath: "assets/images/falooda1.jpg",
      price: 200,
      availableAddons: [
        Addon(name: "Meetha Dhoodh", price: 150),
        Addon(name: "Fresh Milk", price: 200),
      ],
    ),
  ];

// GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

// OPERATIONS

// useer cart
  List<CartItem> _cart = [];

// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //  see if there is a cart item alreADY WITH the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    // itam already exists then increase its quantity

    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise , add a new cart item to cart

    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

// remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }
  // get total proce of cart

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }
  // get total number of titems in the cart

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
// HELPERS

  // genreate a receiot

  // format double value into money

  // format list of addons into a string summary
}
