import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: IconButton(
                icon: Icon(Icons.accessible),
                onPressed: () => Scaffold.of(context).openDrawer())));
  }
}
