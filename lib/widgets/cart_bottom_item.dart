import 'package:flutter/material.dart';

class CardBottomItem extends StatelessWidget {
  const CardBottomItem({
    super.key,
    required this.text, required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
