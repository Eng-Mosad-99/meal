import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category_model.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';

class CatgeoryGridItem extends StatelessWidget {
  const CatgeoryGridItem(
      {super.key, required this.categoryModel, required this.onToggleFavorite});

  final CategoryModel categoryModel;
  final void Function(Meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> filteredMeal = dummyMeals
            .where(
              (meal) => meal.categories.contains(categoryModel.id),
            )
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              onToggleFavorite: onToggleFavorite,
              title: categoryModel.title,
              meals: filteredMeal,
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(.54),
              categoryModel.color.withOpacity(.85),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(
          16,
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
