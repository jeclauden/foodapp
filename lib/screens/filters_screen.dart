import 'package:flutter/material.dart';
import 'package:foodapp/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Center(
        child: Text("Hello"),
      ),
      drawer: const MainDrawer(),
    );
  }
}
