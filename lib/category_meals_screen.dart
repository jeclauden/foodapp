import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String catId;
  // final String catTitle;
  // const CategoryMealsScreen({
  //   // required this.catId,
  //   // required this.catTitle,
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // these are stored when you name the route. See CategoryItem
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: const Center(
        child: Text("The recipes For The Category!"),
      ),
    );
  }
}
