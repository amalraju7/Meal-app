import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  Function isMealFavorite,toggleFavorite;

  MealDetailScreen(this.isMealFavorite,this.toggleFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 300,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final Meal mealItem =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgs['id']);
    final String id = routeArgs['id']!;
    return Scaffold(
      appBar: AppBar(title: Text(id)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                mealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: ((ctx, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(mealItem.ingredients[index]),
                    ))),
                itemCount: mealItem.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(child: Text("#${index + 1}")),
                  title: Text(mealItem.steps[index]),
                ),
                itemCount: mealItem.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children:[ Positioned( right: 10,bottom: 50,
          child: FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () {Navigator.of(context).pop(mealItem.id);},
          ),
        ),Positioned(left: 10,bottom: 50,
          child: FloatingActionButton(
            child: isMealFavorite(mealItem.id)? Icon(Icons.star): Icon(Icons.star_outline),
            onPressed: () {toggleFavorite(mealItem.id);},
          ),
        )],
      ), 
    );
  }
}
