import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';
import 'screens/meals_categories_screen.dart';
import './routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avalaibleMeals = DUMMY_MEALS;

  final List<Meal> _favouriteMeals = [];

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void _setFilters(String key, bool value) {
    setState(() {
      _filters[key] = value;
      //Update meals based on filters
      _avalaibleMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(229, 244, 253, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondesended',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.red),
      ),

      // Can manually register named routes
      routes: {
        AppRoutes.mealTabs: (ctx) => TabsScreen(
              favouriteMeals: _favouriteMeals,
            ),
        AppRoutes.mealCategory: (ctx) => CategoryMealsScreen(
              avalaibleMeals: _avalaibleMeals,
            ),
        AppRoutes.mealDetails: (ctx) => MealDetailsScreen(
              toggleFavourite: _toggleFavourite,
              isFavourite: _isMealFavourite,
            ),
        AppRoutes.filterScreen: (ctx) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters),
      },
      // Fallback is route cannot be found
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
