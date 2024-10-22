import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qasim_milk_shop/models/food.dart';
import 'package:qasim_milk_shop/models/restaurant.dart';
import 'package:qasim_milk_shop/pages/food_page.dart';
import 'package:qasim_milk_shop/utils/my_current_location.dart';
import 'package:qasim_milk_shop/utils/my_description_box.dart';
import 'package:qasim_milk_shop/utils/my_food_tile.dart';
import 'package:qasim_milk_shop/utils/my_silver_app_bar.dart';
import 'package:qasim_milk_shop/utils/my_tab_bar.dart';
import 'package:qasim_milk_shop/utils/mydrawer.dart';

class HomeDash extends StatefulWidget {
  const HomeDash({super.key});

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// sort out a d return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

// return list of foods in given  category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            // get individual  food
            final food = categoryMenu[index];

            // return food tile UI
            return MyFoodTile(
              food: food,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(
                      food: food,
                    ),
                  ),
                );
                // context.go('/food_page');
              },
            );
            // ListTile(
            //   title: Text(categoryMenu[index].name),
            // );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // ,my surrent location
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MyCurrentLocation(),
                ),

                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
            builder: (context, restaurant, child) =>
                TabBarView(controller: _tabController, children: [
                  ...getFoodInThisCategory(restaurant.menu),
                ])),
      ),
    );
  }
}
