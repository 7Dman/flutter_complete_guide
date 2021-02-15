import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final cateforyMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: cateforyMeals[index].title,
              imageUrl: cateforyMeals[index].imageUrl,
              affordability: cateforyMeals[index].affordability,
              complexity: cateforyMeals[index].complexity,
              duration: cateforyMeals[index].duration,
            );
          },
          itemCount: cateforyMeals.length,
        ));
  }
}
