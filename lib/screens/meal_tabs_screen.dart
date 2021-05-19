import 'package:flutter/material.dart';

import '../models/meals.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';

class MealTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  MealTabsScreen(this.favoriteMeals);

  @override
  _MealTabsScreenState createState() => _MealTabsScreenState();
}

class _MealTabsScreenState extends State<MealTabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Meals'},
    {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
  ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
