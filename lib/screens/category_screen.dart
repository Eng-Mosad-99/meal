import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3.5 / 3,
      ),
      children: [
        for (final category in availableCategories)
          CatgeoryGridItem(
            categoryModel: category,
            onToggleFavorite: onToggleFavorite,
            availableMeals: availableMeals,
          ),
      ],
    );
  }
}
