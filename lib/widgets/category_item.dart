import 'package:flutter/material.dart';

import '../screens/Category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meals', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.65), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
