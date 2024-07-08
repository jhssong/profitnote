import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/screens/setting/budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/detail_btn.dart';
import 'package:profitnote/screens/budget/widgets/month_selector.dart';

// ignore: must_be_immutable
class MonthlyBudget extends StatelessWidget {
  int budget = 400000;
  int used = 270000;
  double barPercentage = 0;
  var f = NumberFormat('###,###,###,###');

  MonthlyBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    barPercentage = used / budget;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('${f.format(used)}원',
                  style: TextStyle(
                      color: ColorTheme.expenseColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(
                ' / ${f.format(budget)}원',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Stack(
            children: [
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                value: barPercentage, // pergentage of the progress bar
                backgroundColor: ColorTheme.cardText,
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorTheme.expenseColor),
                minHeight: 23 * MediaQuery.of(context).textScaler.scale(1),
              ),
              Text("  ${barPercentage * 100}%",
                  style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
