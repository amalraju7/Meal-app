import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: (){ tapHandler();},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle("Filters", Icons.settings, 
            (){ Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
