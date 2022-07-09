import 'package:flutter/material.dart';
import '../screens/Category_meals_screen.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

static const routeName = "\ ";


  Widget build(BuildContext context) {
    return Scaffold(
      body:  GridView(
          padding: EdgeInsets.all(25),
            children: 
              DUMMY_CATEGORIES
                  .map(
                    (catData) => CategoryItem(catData.id,catData.title, catData.color),
                  )
                  .toList(),
            
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            
            )),
      
    );
  }
}
