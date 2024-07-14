import 'package:flutter/material.dart';
import 'package:profitnote/screens/budget/widgets/monthly_budget.dart';
import 'package:profitnote/style/theme.dart';
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
    const Tab(text: "전체 금액"),
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
        titleSpacing: 0,
        title: const Text("예산"),
      ),
      body: Column(
        children: [
          MonthlyBudget(),
          Container(
            color: ColorTheme.cardBackground,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.white, width: 2)),
              ),
              child: TabBar(
                tabs: _tabs,
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorTheme.expenseColor,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                unselectedLabelColor: ColorTheme.cardLabelText,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(children: <Widget>[
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류1",
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류2",
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류3",
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                ]),
                ListView(children: <Widget>[
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류1",
                                style: TextStyle(color: ColorTheme.cardText)),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류2",
                                style: TextStyle(color: ColorTheme.cardText)),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                  ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      leading: const Icon(Icons.money_rounded),
                      iconColor: ColorTheme.cardText,
                      collapsedIconColor: ColorTheme.cardLabelText,
                      backgroundColor: ColorTheme.backgroundOfBackground,
                      collapsedBackgroundColor: ColorTheme.cardBackground,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("대분류3",
                                style: TextStyle(color: ColorTheme.cardText)),
                            Text("0원",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]),
                      children: <Widget>[
                        CategoryTile(
                          icon: Icons.food_bank,
                          label: '소분류1',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons.living,
                          label: '소분류2',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                        CategoryTile(
                          icon: Icons
                              .category, // TODO Replace null with an appropriate icon
                          label: '소분류3',
                          spent: '0원',
                          onTapped: () {},
                          onLongPressed: null,
                        ),
                      ]),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
