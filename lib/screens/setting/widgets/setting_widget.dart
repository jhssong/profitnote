import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget(
      {super.key, required this.title, required this.items, this.onTapped});
  final String title;
  final List<String> items;
  final Function(int)? onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
      ),
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: items
                .map((e) => ListTile(
                      minTileHeight: 0,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyLarge,
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
