import 'package:flutter/material.dart';
import 'package:meal_app/widgets/switch_list_tile_items.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  glutenFree,
  vegan,
  lactoseFree,
  vegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilter[Filter.glutenFree]!;
    _isLactoseFree = widget.currentFilter[Filter.lactoseFree]!;
    _isVegan = widget.currentFilter[Filter.vegan]!;
    _isVegetarian = widget.currentFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Your Filters',
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTileItem(
              value: _glutenFreeFilter,
              onChanged: (value) {
                setState(() {
                  _glutenFreeFilter = value;
                });
              },
              title: 'Gluten-Free',
              subTitle: 'only include gluten free meals.',
            ),
            SwitchListTileItem(
              value: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
              title: 'Is-Vegan',
              subTitle: 'only include Vegan free meals.',
            ),
            SwitchListTileItem(
              value: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
              title: 'Is-Vegetarian',
              subTitle: 'only include Vegetarian free meals.',
            ),
            SwitchListTileItem(
              value: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
              title: 'Is-LactoseFree',
              subTitle: 'only include Lactose Free meals.',
            ),
          ],
        ),
      ),
    );
  }
}
