import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/screens/detailed_budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_tile.dart';
import 'package:profitnote/widgets/control_btn_group.dart';

class BudgetSettingScreen extends StatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  State<BudgetSettingScreen> createState() => _BudgetSettingScreenState();
}

class _BudgetSettingScreenState extends State<BudgetSettingScreen> {
  var f = NumberFormat('###,###,###,###');

  void _pop() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예산 설정", style: TextStyle(color: ColorTheme.cardLabelText)),
        iconTheme: IconThemeData(
          color: ColorTheme.cardLabelText,
        ),
      ),
      body: Column(
        children: [
          ControlBtnGroup(
            titleList: const ['완료', '취소'],
            callbackList: [_pop, _pop],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.03",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.04",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.05",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
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
