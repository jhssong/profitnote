import 'package:profitnote/style/theme.dart';
import 'package:intl/intl.dart';
import 'card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profitnote/widgets/monthly_budget.dart';
import 'package:percent_indicator/percent_indicator.dart'; // indicator package

class BudgetProgressBar extends StatelessWidget {
  int budget = 400000;
  int used = 270000;
  double ratio = 0;
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    ratio = used / budget;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(f.format(used).toString() + '원',
                style: TextStyle(
                    color: ColorTheme.expenseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(
              ' / ' + f.format(budget).toString() + '원',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        SizedBox(height: 16),
        Stack(
          children: [
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20),
              value: ratio, // pergentage of the progress bar
              backgroundColor: ColorTheme.cardText,
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorTheme.expenseColor),
              minHeight: 25, // height of the progress bar
            ),
            Text("  ${ratio * 100}%",
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ],
    );
  }
}
