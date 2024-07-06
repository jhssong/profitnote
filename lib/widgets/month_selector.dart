import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.backgroundOfBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.chevron_left_rounded, size: 16),
                  color: ColorTheme.cardText,
                  onPressed: () {},
                ),
              ),
              Text('2024.05', style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.chevron_right_rounded, size: 16),
                  color: ColorTheme.cardText,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
