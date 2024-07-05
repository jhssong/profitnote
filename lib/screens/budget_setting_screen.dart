import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_tile.dart';
import 'package:profitnote/widgets/control_btn_group.dart';
import 'package:intl/intl.dart';

class BudgetSettingScreen extends StatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  State<BudgetSettingScreen> createState() => _DetailBudgetScreenState();
}

class _DetailBudgetScreenState extends State<BudgetSettingScreen> {
  var f = NumberFormat('###,###,###,###');

  void _pop() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예산 상세", style: TextStyle(color: ColorTheme.cardLabelText)),
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
                icon: Icons.holiday_village,
                label: "주식",
                spent: '${f.format(200000)}원',
                onTapped: () {},
              ),
              CategoryTile(
                icon: Icons.home,
                label: "생활",
                spent: '${f.format(150000)}원',
                onTapped: () {},
              ),
              CategoryTile(
                icon: Icons.home,
                label: "고정",
                spent: '${f.format(50000)}원',
                onTapped: () {},
              ),
            ],
          ))
        ],
      ),
    );
  }
}
