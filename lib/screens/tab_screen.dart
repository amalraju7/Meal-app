import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Widget> pages ;
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });

  }

@override
  void initState() {
   pages =  [CategoriesScreen(),FavoritesScreen(widget.favouriteMeals)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Meals')),
        drawer: MainDrawer(),
        body: pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: ('Categories'),
              icon: Icon(Icons.category),
              
            ),BottomNavigationBarItem(
              label: ('Favorites'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              
            ),
          ],
        ));
  }
}
