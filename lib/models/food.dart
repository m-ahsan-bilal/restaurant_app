// food model
// ignore_for_file: constant_identifier_names

class Food {
  final String name; // cheese burger
  final String description; //  burgers with chheese
  final String imagePath; // assstes/images/
  final double price; //. 1000 rupees
  final FoodCategory category; // burgers
// add on items list
  List<Addon> availableAddons; // []
  Food(
      {required this.name,
      required this.category,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.availableAddons});
}

// food category enum
enum FoodCategory {
  Burgers, // ["Beef Burger", "Chicken Burger", "Veggie Burger"]
  Sides, // ["French Fries", "Onion Rings", "Mozzarella Sticks"]
  Desserts, // ["Chocolate Sundae", "Cheesecake", "Brownie"]
  Drinks, // ["Soda", "Milkshake", "Iced Coffee"]
}

// food addons model
class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
