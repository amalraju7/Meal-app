import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

List<Meal> favouriteMeals;
FavoritesScreen(this.favouriteMeals);


  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(child: Text('You have no favorites yes - start adding some!'),);

    }
   else{
     return ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id:favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            deleteMeal: (){},
          );
        },
        itemCount: favouriteMeals.length,
      );
   }
  }
}