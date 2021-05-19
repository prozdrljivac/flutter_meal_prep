import 'package:flutter/material.dart';
import 'package:meal_prep/models/meal_filters.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String route = '/settings';
  static const String screenName = 'Settings';

  final Function saveFilters;
  final MealFilters filters;

  SettingsScreen(this.filters, this.saveFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    _isGlutenFree = widget.filters.gluten;
    _isLactoseFree = widget.filters.lactose;
    _isVegan = widget.filters.vegan;
    _isVegetarian = widget.filters.vegetarian;
    super.initState();
  }

  Widget buildSwitch(
    String title,
    String description,
    bool currentValue,
    Function handleChange,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: handleChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SettingsScreen.screenName),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters(
              MealFilters(
                _isGlutenFree,
                _isLactoseFree,
                _isVegan,
                _isVegetarian,
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitch(
                    'Gluten free',
                    'Only include gluen-free meals.',
                    _isGlutenFree,
                    (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  buildSwitch(
                    'Lactose free',
                    'Only include lactose-free meals.',
                    _isLactoseFree,
                    (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                  buildSwitch(
                    'Vegan',
                    'Only include vegan meals.',
                    _isVegan,
                    (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                  buildSwitch(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _isVegetarian,
                    (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
