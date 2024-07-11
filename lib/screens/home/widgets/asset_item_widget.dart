import 'package:flutter/material.dart';
import 'package:profitnote/screens/home/widgets/spline_graph_widget.dart';
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
            fixedSize: const Size.fromHeight(45),
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
                data.asset,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 32),
              Text(
                data.amount.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
