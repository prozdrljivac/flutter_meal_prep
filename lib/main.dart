import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meals.dart';
import 'models/meal_filters.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/meal_tabs_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  static const String app_name = 'Meal prep';

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  MealFilters _filters = MealFilters(false, false, false, false);
  List<Meal> _available_meals = DUMMY_MEALS;
  List<Meal> _favorite_meals = [];

  void _setFilters(MealFilters selectedFilters) {
    setState(() {
      _filters = selectedFilters;
    });

    _available_meals = DUMMY_MEALS.where((meal) {
      if(_filters.gluten && !meal.isGlutenFree) {
        return false;
      }
      if(_filters.lactose && !meal.isLactoseFree) {
        return false;
      }
      if(_filters.vegan && !meal.isVegan) {
        return false;
      }
      if(_filters.vegetarian && !meal.isVegetarian) {
        return false;
      }

      return  true;
    }).toList();
  }

  void _toggleFavorite(String mealId) {
    final existingMealId = _favorite_meals.indexWhere((meal) => meal.id == mealId);
    if (existingMealId >= 0) {
      setState(() {
        _favorite_meals.removeAt(existingMealId);
      });
    } else {
      setState(() {
        _favorite_meals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavoriteMeal(String mealId) {
    return _favorite_meals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: App.app_name,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: MealTabsScreen(_favorite_meals),
      routes: {
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(_available_meals),
        MealDetailScreen.route: (context) => MealDetailScreen(_toggleFavorite, _isFavoriteMeal),
        SettingsScreen.route: (context) => SettingsScreen(_filters, _setFilters),
      },
    );
  }
}
