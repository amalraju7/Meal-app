import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {'gluten':false,'lactose':false,'vegetarian':false,'vegan':false};

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters( Map<String,bool> FilterData){
    setState(() {
      _filters = FilterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
          if(_filters['lactose']! && !meal.isLactoseFree) {
            return false;
          }
          if(_filters['vegetarian']! && !meal.isVegetarian) {
            return false;
          }
          if(_filters['vegan']! && !meal.isVegan) {
            return false;
          }
        return true;

      }).toList();
      
    });
  }

  bool isMealFavorite(String mealId){
    return _favouriteMeals.any((meal) => mealId == meal.id);

  }

void toggleFavourite(String mealId){

  final ExistingIndex = _favouriteMeals.indexWhere((meal) => mealId == meal.id);
  if(ExistingIndex >= 0){
   
          setState(() {
  
    _favouriteMeals.removeAt(ExistingIndex);
      });
  }
  else{
    setState(() {
      

    _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
        });
  }


}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(bodyText1: TextStyle(color: Color.fromRGBO(20, 52, 52, 1)),
        bodyText2: TextStyle(color: Color.fromRGBO(20, 52, 52, 1) ),
        headline6: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold))
      ),
   
      routes: { '/':(ctx) => TabScreen(_favouriteMeals),
       
              CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
               MealDetailScreen.routeName: (ctx) => MealDetailScreen(isMealFavorite,toggleFavourite), 
               FilterScreen.routeName: (ctx)=> FilterScreen(_setFilters,_filters)},
    );
  }
}
