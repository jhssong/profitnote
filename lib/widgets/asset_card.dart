import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
    required this.title,
    required this.assetListInGroup,
    this.isEditMode = false,
  });

  final String title;
  final List<Map<String, double>> assetListInGroup;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
        border: Border(
          bottom: BorderSide(width: 1.5, color: ColorTheme.stroke),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.money),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorTheme.cardLabelText,
                    ),
              ),
            ],
          ),
          for (int index = 0; index < assetListInGroup.length; index++) ...[
            const SizedBox(height: 8),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorTheme.cardBackground,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("KRW", style: Theme.of(context).textTheme.bodyLarge),
                  Text("10,000원", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
