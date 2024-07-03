import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/monthly_budget.dart';
import 'package:profitnote/widgets/budget_progress_bar.dart';
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
      appBar: AppBar(
        title: const Text("예산"),
      ),
      body: Column(
        children: [
          MonthlyBudget(
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
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: ColorTheme.cardText,
            unselectedLabelColor: ColorTheme.cardLabelText,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(children: <Widget>[
                  CategoryTile(
                    icon: Icons.payment,
                    label: '월급',
                    spent: '0원',
                    onTapped: () {},
                  ),
                  CategoryTile(
                    icon: Icons.line_axis,
                    label: '투자',
                    spent: '0원',
                    onTapped: () {},
                  ),
                ]),
                ListView(children: <Widget>[
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
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
