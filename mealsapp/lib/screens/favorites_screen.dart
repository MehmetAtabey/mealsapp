import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesmeal;
  FavoritesScreen(this.favoritesmeal);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(favoritesmeal[index]);
      },
      itemCount: favoritesmeal.length,
    );
  }
}
