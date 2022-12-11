import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';
import 'package:foodapp/utilities/custom_row.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  String getIngredients(List<String> ingredients) {
    var buffer = StringBuffer();
    for (var element in ingredients) {
      buffer.write('\n$element');
    }
    return buffer.toString();
  }

  List<CustomRow> getInstunctions(List<String> instructions) {
    var counter = 1;
    List<CustomRow> rows = [];
    for (var inst in instructions) {
      rows.add(CustomRow(
        text: inst,
        bulletString: '$counter.',
      ));
      counter++;
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    // Get the meal id from route
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    // Find the meal by using the id
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Ingredients",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 15),
                  child: Text(
                    getIngredients(selectedMeal.ingredients),
                    style: const TextStyle(
                      height: 1.6,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Instructions",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 15),
                  child: Column(
                    children: getInstunctions(selectedMeal.steps)
                        .map((e) => e)
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
