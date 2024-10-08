import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class CategoryItem {
  final String description;
  final String amount;

  CategoryItem({required this.description, required this.amount});
}

class CategoryItemsWidget extends StatelessWidget {
  final List<CategoryItem> items;
  final Function(int index, String description) onPressed;
  const CategoryItemsWidget(
      {super.key, required this.items, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, int idx) {
        final data = items[idx];
        return ElevatedButton(
          onPressed: () => onPressed(idx, data.description),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(45),
            backgroundColor: ColorTheme.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.center,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 32),
              Text(
                data.amount,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
