import 'package:flutter/material.dart';
import 'package:profitnote/screens/home/widgets/stack_graph_widget.dart';
import 'package:profitnote/style/theme.dart';

class AssetItemWidget extends StatelessWidget {
  final List<AssetData> items;
  final Function(int index, String description) onPressed;

  const AssetItemWidget(
      {super.key, required this.items, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, int idx) {
        final data = items[idx];
        return ElevatedButton(
          onPressed: () => onPressed(idx, data.asset),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(60),
            backgroundColor: ColorTheme.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.credit_card,
                color: ColorTheme.selected,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    data.asset,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Text(
                data.amount.toInt().toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
