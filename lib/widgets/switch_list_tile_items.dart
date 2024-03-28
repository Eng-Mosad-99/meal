import 'package:flutter/material.dart';

class SwitchListTileItem extends StatelessWidget {
  const SwitchListTileItem({
    super.key,
    this.onChanged,
    required this.value,
    required this.title,
    required this.subTitle,
  });
  final void Function(bool)? onChanged;
  final bool value;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 32,
        right: 24,
      ),
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
