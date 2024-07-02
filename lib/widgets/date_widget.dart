import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class DateWidget extends StatelessWidget {
  final String label;
  const DateWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      // height: 50,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: ColorTheme.backgroundOfBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  color: ColorTheme.cardText,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
