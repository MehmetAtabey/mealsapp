import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> pages = [CategoriesScreen(), FavoritesScreen()];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       drawer: MainDrawer(),
    //       appBar: AppBar(
    //           title: Text("Meals"),
    //           bottom: TabBar(tabs: <Widget>[
    //             Tab(icon: Icon(Icons.category), text: "Categories"),
    //             Tab(icon: Icon(Icons.star), text: "Favorites")
    //           ])),
    //       body: TabBarView(
    //         children: <Widget>[CategoriesScreen(), FavoritesScreen()],
    //       ),
    //     ));

    return Scaffold(
        appBar: AppBar(title: Text("Meals App")),
        drawer: MainDrawer(),
        body: pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categories")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favories"))
          ],
        ));
  }
}
