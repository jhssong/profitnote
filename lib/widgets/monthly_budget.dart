import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/detail_btn.dart';
import 'package:profitnote/widgets/month_selector.dart';

class MonthlyBudget extends StatelessWidget {
  const MonthlyBudget({
    super.key,
    required this.title1,
    required this.title2,
    required this.body,
    this.header,
    this.onPressed,
  });

  final String title1;
  final String title2;

  /// If widget doesn't need detail button, then keep this as null
  final Function()? onPressed;
  final Widget body;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              header ?? MonthSelector(),
              if (onPressed != null) DetailBtn(onPressed: onPressed!),
            ],
          ),
          // Header
          Row(
            children: [
              Text(title1, style: Theme.of(context).textTheme.titleMedium),
              Text(title2, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          const SizedBox(height: 16),
          // Body
          body,
        ],
      ),
    );
  }
}
