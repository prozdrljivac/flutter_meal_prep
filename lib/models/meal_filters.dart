import 'package:flutter/foundation.dart';

class MealFilters {
  final bool gluten;
  final bool lactose;
  final bool vegan;
  final bool vegetarian;

  MealFilters(
    @required this.gluten,
    @required this.lactose,
    @required this.vegan,
    @required this.vegetarian,
  );
}