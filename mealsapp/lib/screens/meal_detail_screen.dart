import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";
  Meal _meal;
  Function toggleFavorite;
  Function isFavorite;
  MealDetail(this.toggleFavorite, this.isFavorite);

  Widget buildSection(BuildContext ctx, String title) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(title, style: Theme.of(ctx).textTheme.headline6),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    _meal = routeArgs["model"] as Meal;
    return Scaffold(
        appBar: AppBar(title: Text(_meal.title)),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(_meal.imageUrl, fit: BoxFit.cover)),
            buildSection(context, "Ingredients"),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _meal.ingredients[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                itemCount: _meal.ingredients.length)),
            buildSection(context, "Steps"),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(
                            _meal.steps[index],
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: _meal.steps.length)),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(isFavorite(_meal.id) ? Icons.star : Icons.star_border),
            onPressed: () => toggleFavorite(_meal.id)));
  }
}
