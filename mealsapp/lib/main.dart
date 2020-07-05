import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoritesMeals = [];

  void toggleFavorite(String mealId) {
    final exsistingIndex =
        favoritesMeals.indexWhere((element) => element.id == mealId);
    if (exsistingIndex >= 0) {
      setState(() {
        favoritesMeals.removeAt(exsistingIndex);
      });
    } else
      setState(() {
        favoritesMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  bool isMealFavorite(String id) {
    return favoritesMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => TabsScreen(favoritesMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetail.routeName: (ctx) => MealDetail(toggleFavorite,isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
