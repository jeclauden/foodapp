enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  // Strings
  final String id;
  final String title;
  final String imageUrl;
  // Int
  final int duration;
  //List
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  //Bools
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  final Affordability affordability;
  final Complexity complexity;

  const Meal({
    required this.affordability,
    required this.complexity,
    required this.id,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.ingredients,
    required this.steps,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
  });
}
