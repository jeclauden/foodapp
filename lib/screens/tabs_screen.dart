import 'package:flutter/material.dart';
import 'package:foodapp/screens/favourites_screen.dart';
import 'package:foodapp/screens/meals_categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavouritesScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  String getTitle(int index) {
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
        title: Text(getTitle(_selectedPageIndex)),
      ),
      body: _pages[_selectedPageIndex],
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
