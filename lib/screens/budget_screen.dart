import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/card_widget.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/control_btn_group.dart';
import 'package:profitnote/widgets/input_widget.dart';
import 'package:profitnote/widgets/monthly_budget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';
import 'package:profitnote/widgets/type_selection_btn.dart';
import 'package:profitnote/widgets/type_selection_btn.dart';
import 'package:profitnote/widgets/month_selector.dart';
import 'package:profitnote/widgets/budget_progress_bar.dart';
import 'package:profitnote/widgets/category_tile.dart';
import 'package:profitnote/widgets/category_tile.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabs = [
    const Tab(text: "수입"),
    const Tab(text: "지출"),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("예산"),
      // ),
      body: Column(
        children: [
          MonthlyBudget(
            header: MonthSelector(),
            onPressed: () {},
            title1: "남은 예산",
            title2: "(월별)",
            body: BudgetProgressBar(),
          ),
          TabBar(
            tabs: _tabs,
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: ColorTheme.expenseColor,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 109),
            ),
            labelColor: ColorTheme.cardText,
            unselectedLabelColor: ColorTheme.cardLabelText,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                    child: ListView(children: <Widget>[
                  CategoryTile(
                    icon: Icons.food_bank,
                    label: '식비',
                    spent: '0원',
                    onTapped: () {},
                  ),
                  CategoryTile(
                    icon: Icons.living,
                    label: '생활',
                    spent: '0원',
                    onTapped: () {},
                  ),
                  CategoryTile(
                    icon: Icons.money,
                    label: '고정비',
                    spent: '0원',
                    onTapped: () {},
                  ),
                ])),
                Container(
                    child: ListView(children: <Widget>[
                  CategoryTile(
                    icon: Icons.payment,
                    label: '월급',
                    spent: '0원',
                    onTapped: () {},
                  ),
                  CategoryTile(
                    icon: Icons.money_off_csred_outlined,
                    label: 'Shopping',
                    spent: '0원',
                    onTapped: () {},
                  ),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
