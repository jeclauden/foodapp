import 'package:flutter/material.dart';
import 'package:foodapp/routes/app_routes.dart';

import '../models/meal.dart';

import 'package:gap/gap.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  Gap get getSpacer {
    return const Gap(10);
  }

  void viewMealDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      AppRoutes.mealDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewMealDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // The following widget helps to make its child clippable
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned Widget works inside a Stack so that it can be positioned
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        getSpacer,
                        Text("$duration mins"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        getSpacer,
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        getSpacer,
                        Text(affordabilityText),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
