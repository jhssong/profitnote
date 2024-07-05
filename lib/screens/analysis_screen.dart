import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/utils/datetime_month_operation.dart';
import 'package:profitnote/widgets/category_item_widget.dart';
import 'package:profitnote/widgets/graph_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
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
    print('Index: $index, Left String: $leftString');
  }

  void _handleToggle(int index) {
    _typeNotifier.value = index;
    print('Index: $index');
  }

  @override
  Widget build(BuildContext context) {
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
          _buildToggleRow(),
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
          child: const Icon(Icons.chevron_left),
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
          child: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildToggleRow() {
    return ValueListenableBuilder<int>(
      valueListenable: _pressedIndexNotifier,
      builder: (context, pressedIndex, child) {
        if (pressedIndex < 0) {
          return ValueListenableBuilder<int>(
            valueListenable: _typeNotifier,
            builder: (context, typeIndex, child) {
              return Container(
                color: ColorTheme.cardBackground,
                height: 42,
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "수입",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "지출",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
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
              );
            },
          );
        } else {
          return GestureDetector(
            onTap: () {
              _pressedIndexNotifier.value = -1;
            },
            child: Container(
              color: ColorTheme.cardBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.chevron_left),
                            TextButton(
                              onPressed: () {
                                _pressedIndexNotifier.value = -1;
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ColorTheme.cardBackground,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                _pressedString,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 2, color: ColorTheme.cardLabelText),
                      ],
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
              );
            },
          );
        } else {
          return Expanded(
            child: CategoryItemsWidget(
              items: expenseList_1,
              onPressed: (int index, String leftString) {},
            ),
          );
        }
      },
    );
  }
}
