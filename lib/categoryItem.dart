import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategortItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategortItem({
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(title),
    );
  }
}
