import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/utils/datetime_month_operation.dart';
import 'package:profitnote/screens/setting/widgets/category_item_widget.dart';
import 'package:profitnote/screens/analysis/widgets/graph_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> _pressedIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> _typeNotifier = ValueNotifier(0);
  final List<CategoryItem> incomeList = [
    CategoryItem(description: '월급', amount: '0원'),
    CategoryItem(description: '고정', amount: '0원'),
  ];

  final List<CategoryItem> expenseList = [
    CategoryItem(description: '식비', amount: '0원'),
    CategoryItem(description: '생활', amount: '0원'),
    CategoryItem(description: '고정', amount: '0원'),
  ];

  final List<CategoryItem> expenseList_1 = [
    CategoryItem(description: '프랭크버거', amount: '10000원'),
    CategoryItem(description: '푸행쿠버거', amount: '10000원'),
    CategoryItem(description: '마마터치', amount: '10000원'),
  ];

  late DateTime _selectedDateTime;
  late String _selectedMonth;
  late TabController _tabController;
  String _pressedString = "";

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
    _selectedMonth = DateFormat('yyyy-MM').format(_selectedDateTime);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handlePressed(int index, String leftString) {
    _pressedIndexNotifier.value = index;
    setState(() {
      _pressedString = leftString;
    });
  }

  void _handleToggle(int index) {
    _typeNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Tab(text: "수입"),
      const Tab(text: "지출"),
    ];
    final data = [
      SalesData('주식', 10000, "10%"),
      SalesData('생활', 10000, "10%"),
      SalesData('고정', 80000, "80%"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('통계 화면'),
      ),
      body: Column(
        children: [
          _buildMonthRow(),
          GraphWidget(data: data),
          _buildToggleRow(tabs),
          _buildCategoryItems(),
        ],
      ),
    );
  }

  Widget _buildMonthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            DateTime nextMonth = getPreviousMonthDate(_selectedDateTime);
            setState(() {
              _selectedDateTime = nextMonth;
              _selectedMonth = DateFormat('yyyy-MM').format(_selectedDateTime);
            });
          },
          child: Icon(
            Icons.chevron_left,
            color: ColorTheme.cardLabelText,
          ),
        ),
        Text(
          _selectedMonth,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {
            DateTime nextMonth = getNextMonthDate(_selectedDateTime);
            setState(() {
              _selectedDateTime = nextMonth;
              _selectedMonth = DateFormat('yyyy-MM').format(_selectedDateTime);
            });
          },
          child: Icon(
            Icons.chevron_right,
            color: ColorTheme.cardLabelText,
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(List<Widget> tabs) {
    return ValueListenableBuilder<int>(
      valueListenable: _pressedIndexNotifier,
      builder: (context, pressedIndex, child) {
        if (pressedIndex < 0) {
          return ValueListenableBuilder<int>(
            valueListenable: _typeNotifier,
            builder: (context, typeIndex, child) {
              return Container(
                color: ColorTheme.cardBackground,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorTheme.cardLabelText, width: 2)),
                  ),
                  child: TabBar(
                    tabs: tabs,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
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
                ),
              );
            },
          );
        } else {
          return GestureDetector(
            onTap: () {
              _pressedIndexNotifier.value = -1;
            },
            child: Container(
              // height: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: ColorTheme.cardBackground,
                border: Border(
                    bottom:
                        BorderSide(color: ColorTheme.cardLabelText, width: 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.chevron_left),
                  const SizedBox(width: 8),
                  Text(
                    _pressedString,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorTheme.cardLabelText,
                        ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildCategoryItems() {
    return ValueListenableBuilder<int>(
      valueListenable: _pressedIndexNotifier,
      builder: (context, pressedIndex, _) {
        if (pressedIndex < 0) {
          return ValueListenableBuilder<int>(
            valueListenable: _typeNotifier,
            builder: (context, type, _) {
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  color: ColorTheme.cardBackground,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CategoryItemsWidget(
                        key: const ValueKey<int>(0),
                        items: incomeList,
                        onPressed: _handlePressed,
                      ),
                      CategoryItemsWidget(
                        key: const ValueKey<int>(1),
                        items: expenseList,
                        onPressed: _handlePressed,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              color: ColorTheme.cardBackground,
              child: CategoryItemsWidget(
                items: expenseList_1,
                onPressed: (int index, String leftString) {},
              ),
            ),
          );
        }
      },
    );
  }
}
