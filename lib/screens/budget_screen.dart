import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/monthly_budget.dart';
import 'package:profitnote/widgets/category_tile.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<Widget> _tabs = [
    const Tab(text: "사용 금액"),
    const Tab(text: "남은 금액"),
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
          const MonthlyBudget(),
          Container(
            color: ColorTheme.cardBackground,
            child: TabBar(
              tabs: _tabs,
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: ColorTheme.expenseColor,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ColorTheme.cardText,
              unselectedLabelColor: ColorTheme.cardLabelText,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
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
                    icon: Icons
                        .category, // TODO Replace null with an appropriate icon
                    label: '고정비',
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
                    icon: Icons
                        .category, // TODO Replace null with an appropriate icon
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
