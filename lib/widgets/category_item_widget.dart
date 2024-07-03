import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class CategoryItemsWidget extends StatelessWidget {
  const CategoryItemsWidget(
      {super.key, required this.items, required this.onPressed});
  final List<Map<String, String>> items;
  final Function(int index, String leftString) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, int idx) {
        final data = items[idx];
        return ElevatedButton(
          onPressed: () => onPressed(idx, data['leftString']!),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['leftString']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 32),
              Text(
                data['rightString']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
