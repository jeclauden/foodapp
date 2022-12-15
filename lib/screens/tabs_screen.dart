import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/favourites_screen.dart';
import '../screens/meals_categories_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen({
    Key? key,
    required this.favouriteMeals,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // This initialisation allows to get access to the widget.favouriteMeals
  @override
  void initState() {
    _pages = [
      const CategoriesScreen(),
      FavouritesScreen(
        favouriteMeals: widget.favouriteMeals,
      ),
    ];
    super.initState();
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return "Categories";
      case 1:
        return "Your Favourites";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedPageIndex)),
      ),
      body: _pages[_selectedPageIndex],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          )
        ],
      ),
    );
  }
}
