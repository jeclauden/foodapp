import 'package:flutter/material.dart';
import 'package:foodapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegeterian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegeterian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  // Create a SwitchListTile
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    ValueChanged<bool> updateValue, // Function does not work
  ) {
    return SwitchListTile.adaptive(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        // actions: [
        //   IconButton(
        //       onPressed: (() {
        //         final selectedFilters = {
        //           'gluten': _glutenFree,
        //           'lactose': _lactoseFree,
        //           'vegan': _vegan,
        //           'vegetarian': _vegeterian,
        //         };
        //         widget.saveFilters(selectedFilters);
        //       }),
        //       icon: const Icon(
        //         Icons.save,
        //       ))
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile(
                "Gluten Free",
                "Only include gluten free meals",
                _glutenFree,
                (bool newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                      widget.saveFilters('gluten', newValue);
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Lactose Free",
                "Only include lactose free meals",
                _lactoseFree,
                (bool newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                      widget.saveFilters('lactose', newValue);
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include vegetarian meals",
                _vegeterian,
                (bool newValue) {
                  setState(
                    () {
                      _vegeterian = newValue;
                      // var kand = {'vegetarian': newValue};
                      widget.saveFilters('vegetarian', newValue);
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vega",
                "Only include vega meals",
                _vegan,
                (bool newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                      widget.saveFilters('vegan', newValue);
                    },
                  );
                },
              ),
            ]),
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
