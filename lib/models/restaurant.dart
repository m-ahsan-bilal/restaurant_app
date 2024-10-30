import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

// GETTERS

  final List<Food> _menu = [
    // Burgers Category
    Food(
      category: FoodCategory.Burgers,
      name: "Classic Beef Burger",
      description: "Juicy beef patty with lettuce, tomato, and cheese",
      imagePath: "assets/images/beef burger.jpeg",
      price: 850,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 50),
        Addon(name: "Bacon", price: 100),
      ],
    ),
    Food(
      category: FoodCategory.Burgers,
      name: "Crispy Chicken Burger",
      description: "Golden fried chicken with spicy mayo and pickles",
      imagePath: "assets/images/chicken burger.jpeg",
      price: 750,
      availableAddons: [
        Addon(name: "Extra Sauce", price: 30),
        Addon(name: "Lettuce", price: 20),
      ],
    ),
    Food(
      category: FoodCategory.Burgers,
      name: "Veggie Burger",
      description: "Grilled veggie patty with lettuce, tomato, and avocado",
      imagePath: "assets/images/veggie burger.jpeg",
      price: 700,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 50),
        Addon(name: "Vegan Cheese", price: 40),
      ],
    ),
    Food(
      category: FoodCategory.Burgers,
      name: "Double Cheese Burger",
      description:
          "Two beef patties, double cheese, and all the classic toppings",
      imagePath: "assets/images/double cheese burger.jpeg",
      price: 1000,
      availableAddons: [
        Addon(name: "Onion Rings", price: 60),
        Addon(name: "Extra Patty", price: 200),
      ],
    ),

    // Sides Category
    Food(
      category: FoodCategory.Sides,
      name: "French Fries",
      description: "Crispy golden fries with a hint of salt",
      imagePath: "assets/images/French Fries.jpeg",
      price: 250,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 50),
        Addon(name: "Chili Powder", price: 20),
      ],
    ),
    Food(
      category: FoodCategory.Sides,
      name: "Onion Rings",
      description: "Crispy fried onion rings with a side of ranch",
      imagePath: "assets/images/Onion Rings.jpeg",
      price: 200,
      availableAddons: [
        Addon(name: "Spicy Sauce", price: 30),
        Addon(name: "Extra Ranch", price: 20),
      ],
    ),
    Food(
      category: FoodCategory.Sides,
      name: "Mozzarella Sticks",
      description: "Crispy sticks filled with melted mozzarella cheese",
      imagePath: "assets/images/Mozzarella Sticks.jpeg",
      price: 300,
      availableAddons: [
        Addon(name: "Marinara Sauce", price: 40),
        Addon(name: "Ranch", price: 30),
      ],
    ),
    Food(
      category: FoodCategory.Sides,
      name: "Chicken Nuggets",
      description: "Crispy, golden nuggets served with dipping sauce",
      imagePath: "assets/images/Chicken Nuggets.jpeg",
      price: 350,
      availableAddons: [
        Addon(name: "BBQ Sauce", price: 30),
        Addon(name: "Honey Mustard", price: 30),
      ],
    ),

    // Desserts Category
    Food(
      category: FoodCategory.Desserts,
      name: "Chocolate Sundae",
      description: "Rich chocolate ice cream topped with fudge",
      imagePath: "assets/images/Chocolate Sundae.jpeg",
      price: 400,
      availableAddons: [
        Addon(name: "Extra Fudge", price: 50),
        Addon(name: "Whipped Cream", price: 30),
      ],
    ),
    Food(
      category: FoodCategory.Desserts,
      name: "Cheesecake",
      description: "Creamy cheesecake with a graham cracker crust",
      imagePath: "assets/images/Cheesecake.jpeg",
      price: 500,
      availableAddons: [
        Addon(name: "Berry Sauce", price: 60),
        Addon(name: "Fresh Strawberries", price: 80),
      ],
    ),
    Food(
      category: FoodCategory.Desserts,
      name: "Brownie",
      description: "Warm, fudgy brownie with chocolate chunks",
      imagePath: "assets/images/Brownie.jpeg",
      price: 300,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 100),
        Addon(name: "Caramel Sauce", price: 40),
      ],
    ),
    Food(
      category: FoodCategory.Desserts,
      name: "Apple Pie",
      description: "Classic apple pie with a flaky crust",
      imagePath: "assets/images/Apple Pie.jpeg",
      price: 350,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 100),
        Addon(name: "Whipped Cream", price: 50),
      ],
    ),

    // Drinks Category
    Food(
      category: FoodCategory.Drinks,
      name: "Soda",
      description: "Chilled soda available in multiple flavors",
      imagePath: "assets/images/soda.jpeg",
      price: 150,
      availableAddons: [
        Addon(name: "Extra Ice", price: 10),
        Addon(name: "Lemon Wedge", price: 15),
      ],
    ),
    Food(
      category: FoodCategory.Drinks,
      name: "Milkshake",
      description:
          "Creamy milkshake available in chocolate, vanilla, or strawberry",
      imagePath: "assets/images/Milkshake.jpeg",
      price: 300,
      availableAddons: [
        Addon(name: "Extra Scoop of Ice Cream", price: 70),
        Addon(name: "Whipped Cream", price: 50),
      ],
    ),
    Food(
      category: FoodCategory.Drinks,
      name: "Iced Coffee",
      description: "Chilled coffee with a splash of milk",
      imagePath: "assets/images/Iced Coffee.jpeg",
      price: 250,
      availableAddons: [
        Addon(name: "Caramel Syrup", price: 30),
        Addon(name: "Extra Shot", price: 50),
      ],
    ),
    Food(
      category: FoodCategory.Drinks,
      name: "Lemonade",
      description: "Refreshing lemonade made with fresh lemons",
      imagePath: "assets/images/Lemonade.jpeg",
      price: 200,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 20),
        Addon(name: "Extra Lemon", price: 15),
      ],
    ),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

// OPERATIONS

// useer cart
  final List<CartItem> _cart = [];

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

  // genreate a receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt....");
    receipt.writeln();

    // format the date to incude up tp seconds onlly

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln(" -----------------------------------------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} × ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln(" -----------------------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    return receipt.toString();
  }

  // format double value into money

  String _formatPrice(double price) {
    return "Rs. " + price.toStringAsFixed(2);
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(", ");
  }
}
