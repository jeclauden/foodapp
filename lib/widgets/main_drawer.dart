import 'package:flutter/material.dart';
import 'package:foodapp/routes/app_routes.dart';
import 'package:gap/gap.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(
      String title,
      IconData icon,
      VoidCallback onTapHandler,
    ) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        onTap: onTapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 115,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: const Text(
              "Cooking up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(20),
          buildListTile("Meals", Icons.restaurant, (() {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.mealTabs,
            );
          })),
          buildListTile("Settings", Icons.settings, (() {
            // pushedReplacementName removes the current route after the new one is pushed
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.filterScreen,
            );
          })),
        ],
      ),
    );
  }
}
