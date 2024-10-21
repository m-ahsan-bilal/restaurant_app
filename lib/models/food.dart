// food model
// ignore_for_file: constant_identifier_names

class Food {
  final String name; // Pure milk
  final String description; // Pure organic milk
  final String imagePath; // assstes/images
  final double price; //. 270 rupees
  final FoodCategory category; // milk
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
  Milk, // [ "fresh milk ", "pure fresh milk",]
  Sides, // ["dahi bhallay"]
  Desserts, // ["ras malai", " khoya", "barfi",]
  Drinks, // [ meetha dhoodh, faluda , rabri dhoodh]
}

// food addons model
class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
