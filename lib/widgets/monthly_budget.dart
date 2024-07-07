import 'package:flutter/material.dart';
import 'package:profitnote/screens/budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/budget_progress_bar.dart';
import 'package:profitnote/widgets/detail_btn.dart';
import 'package:profitnote/widgets/month_selector.dart';

class MonthlyBudget extends StatelessWidget {
  const MonthlyBudget({
    super.key,
  });

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
              const MonthSelector(),
              DetailBtn(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BudgetSettingScreen(),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("남은 예산", style: Theme.of(context).textTheme.titleMedium),
              Text("(월별)", style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          const SizedBox(height: 16),
          BudgetProgressBar(),
        ],
      ),
    );
  }
}
