import 'package:profitnote/style/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BudgetProgressBar extends StatefulWidget {
  const BudgetProgressBar({super.key});

  @override
  State<BudgetProgressBar> createState() => _BudgetProgressBarState();
}

class _BudgetProgressBarState extends State<BudgetProgressBar> {
  final int budget = 400000;
  final int used = 270000;
  late double ratio;
  var f = NumberFormat('###,###,###,###');

  @override
  void initState() {
    ratio = used / budget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              '${f.format(used)}원',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorTheme.expenseColor,
                  ),
            ),
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
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Text("${ratio * 100}%",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ],
    );
  }
}
