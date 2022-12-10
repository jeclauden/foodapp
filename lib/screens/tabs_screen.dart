import 'package:flutter/material.dart';
import '../screens/favourites_screen.dart';
import '../screens/meals_categories_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favourites",
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
