import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _veganFree = false;
  bool _vegetarianFree = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(
      String title, String subTitle, bool value, Function updateFunc) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: updateFunc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filter")),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Adjust Your meal Seletion!",
                    style: Theme.of(context).textTheme.headline6)),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    "Gluten Free",
                    "Only Gluten free meals",
                    _glutenFree,
                    (newValue) => setState(() {
                          _glutenFree = newValue;
                        })),
                _buildSwitchTile(
                    "Vegan Free",
                    "Only Vegan free meals",
                    _veganFree,
                    (newValue) => setState(() {
                          _veganFree = newValue;
                        })),
                _buildSwitchTile(
                    "Vegetarian Free",
                    "Only Vegetarian free meals",
                    _vegetarianFree,
                    (newValue) => setState(() {
                          _vegetarianFree = newValue;
                        })),
                _buildSwitchTile(
                    "Lactose Free",
                    "Only Lactose free meals",
                    _lactoseFree,
                    (newValue) => setState(() {
                          _lactoseFree = newValue;
                        }))
              ],
            ))
          ],
        ));
  }
}
