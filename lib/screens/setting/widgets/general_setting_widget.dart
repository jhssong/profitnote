import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class GeneralSettingWidget extends StatelessWidget {
  const GeneralSettingWidget(
      {super.key, required this.title, required this.items, this.onTapped});
  final String title;
  final List<String> items;
  final Function(int)? onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: items
                .map((e) => ListTile(
                      minTileHeight: 0,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        if (onTapped != null) {
                          onTapped!(items.indexOf(e));
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
