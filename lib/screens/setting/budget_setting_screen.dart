import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/screens/setting/detailed_budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_tile.dart';

class BudgetSettingScreen extends StatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  State<BudgetSettingScreen> createState() => _BudgetSettingScreenState();
}

class _BudgetSettingScreenState extends State<BudgetSettingScreen> {
  final _controller = TextEditingController();
  var f = NumberFormat('###,###,###,###');
  final Map<String, int> _budgets = {
    "2024.03": 0,
    "2024.04": 0,
    "2024.05": 0,
  };

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("예산 설정"),
        iconTheme: IconThemeData(
          color: ColorTheme.cardLabelText,
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.03",
                  spent: '${f.format(_budgets["2024.03"])}원',
                  onTapped: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                const DetailedBudgetSettingScreen()))
                        .then((value) {
                      setState(() {
                        _budgets["2024.03"] = value;
                      });
                    });
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.04",
                  spent: '${f.format(_budgets["2024.04"])}원',
                  onTapped: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                const DetailedBudgetSettingScreen()))
                        .then((value) {
                      setState(() {
                        _budgets["2024.04"] = value;
                      });
                    });
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.05",
                  spent: '${f.format(_budgets["2024.05"])}원',
                  onTapped: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                const DetailedBudgetSettingScreen()))
                        .then((value) {
                      setState(() {
                        _budgets["2024.05"] = value;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
