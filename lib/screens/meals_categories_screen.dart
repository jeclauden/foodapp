import 'package:flutter/material.dart';
import 'package:foodapp/widgets/categoryItem.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catergoty) => CategoryItem(
                  id: catergoty.id,
                  title: catergoty.title,
                  color: catergoty.color,
                ))
            .toList(),
      ),
    );
  }
}
