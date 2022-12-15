import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> avalaibleMeals;

  const CategoryMealsScreen({
    Key? key,
    required this.avalaibleMeals,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> meals = [];
  var _didLoadData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_didLoadData) {
      // These are stored in Navigator route when you name the route. See CategoryItem
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      meals = widget.avalaibleMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      _didLoadData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
