import 'package:flutter/material.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../widgets/snack_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Meal> _favoriteMeals = [];
  void _toggleFavoriteMealStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting == true) {
      setState(() {
        _favoriteMeals.remove(meal);
        showInfoMessage(context, 'Meal is no longer a favorite.');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        showInfoMessage(context, 'Marked as a favorite!.');
      });
    }
  }

  Map<Filter, bool> _selectedFilter = kInitialFilter;
  

  void _setScreen(String identifier) {
    if (identifier == 'Filters') {
      Navigator.of(context).pop();

      Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                currentFilter: _selectedFilter,
              ),
            ),
          )
          .then(
            (value) =>
                setState(() => _selectedFilter = value ?? kInitialFilter),
          );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavorite: _toggleFavoriteMealStatus,
    );
    String activePageTitle = 'Pick your categories';

    if (_currentIndex == 1) {
      activePage = MealsScreen(
        onToggleFavorite: _toggleFavoriteMealStatus,
        meals: _favoriteMeals,
      );
      activePageTitle = 'Favorite';
    }

    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(
          activePageTitle,
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
