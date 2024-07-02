import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class CategoryitemWidget extends StatelessWidget {
  const CategoryitemWidget({super.key, required this.items});
  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, int idx) {
        final data = items[idx];
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 8),
              Text(
                data['leftString']!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 32),
              Text(
                data['rightString']!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
      },
    );
  }
}
