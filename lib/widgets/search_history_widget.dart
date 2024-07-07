import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class SearchHistoryWidget extends StatelessWidget {
  final String label;
  final Function()? onTapped;

  const SearchHistoryWidget(
      {super.key, required this.onTapped, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      minVerticalPadding: 0,
      minTileHeight: 0,
      title: TextButton(
        onPressed: () {
          if (onTapped != null) {
            onTapped!();
          }
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.cancel_outlined),
        iconSize: 16,
        color: ColorTheme.cardText,
        onPressed: () {
          // remove widget
        },
      ),
    );
  }
}
