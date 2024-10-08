import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String spent;
  final Function()? onTapped;

  const CategoryTile({
    super.key,
    required this.icon,
    required this.label,
    required this.spent,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorTheme.cardBackground,
      onTap: () {
        if (onTapped != null) {
          onTapped!();
        }
      },
      leading: Icon(icon, size: 24, color: ColorTheme.cardText),
      title: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      trailing: Text(spent, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
