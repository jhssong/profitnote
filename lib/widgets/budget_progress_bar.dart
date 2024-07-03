import 'package:profitnote/style/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BudgetProgressBar extends StatelessWidget {
  int budget = 400000;
  int used = 270000;
  double ratio = 0;
  var f = NumberFormat('###,###,###,###');

  BudgetProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    ratio = used / budget;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text('${f.format(used)}원',
                style: TextStyle(
                    color: ColorTheme.expenseColor,
                    fontSize: 16,
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
              value: ratio, // pergentage of the progress bar
              backgroundColor: ColorTheme.cardText,
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorTheme.expenseColor),
              minHeight: 23 * MediaQuery.of(context).textScaler.scale(1),
            ),
            Text("  ${ratio * 100}%",
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ],
    );
  }
}
