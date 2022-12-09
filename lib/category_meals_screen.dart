import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String catId;
  final String catTitle;
  const CategoryMealsScreen({
    required this.catId,
    required this.catTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: const Center(
        child: Text("The recipes For The Category!"),
      ),
    );
  }
}
