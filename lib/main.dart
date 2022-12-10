import 'package:flutter/material.dart';
import 'package:foodapp/screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import 'screens/meals_categories_screen.dart';
import './routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: const CategoriesScreen(),
      // onGenerateRoute has other options. Check it out
      // onGenerateRoute: ((settings) {
      //   // some logics here
      //   return MaterialPageRoute(
      //     builder: ((context) => const CategoriesScreen()),
      //   );
      // }),

      // Can manually register named routes
      routes: {
        AppRoutes.mealCategory: (ctx) => const CategoryMealsScreen(),
        AppRoutes.mealDetails: (ctx) => const MealDetailsScreen(),
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
