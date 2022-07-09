import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

    static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  bool initDone = false;
   String? categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    if(!initDone){
     final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
     categoryMeals = widget._availableMeals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
        initDone = true;
        }

    super.didChangeDependencies();
  }

  void deleteMeal(String id){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);

    });
    
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id:categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            deleteMeal: deleteMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
