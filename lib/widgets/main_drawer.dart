import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String idetifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Cooking Up!.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),
          DrawerItem(
            text: 'Meals',
            icon: Icons.restaurant,
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          DrawerItem(
            text: 'Filters',
            icon: Icons.settings,
            onTap: () {
              onSelectScreen('Filters');
            },
          ),
        ],
      ),
    );
  }
}
