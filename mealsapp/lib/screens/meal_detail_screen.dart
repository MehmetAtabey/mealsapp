import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";
  Meal _meal;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    _meal = routeArgs["model"] as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(_meal.title)),
      body: Center(
        child: Text(_meal.title),
      ),
    );
  }
}
