import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
   required this.onToggleFavorite,
  });
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavorite(meal),
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
