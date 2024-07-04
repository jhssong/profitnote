import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/animated_toggle_button.dart';
import 'package:profitnote/widgets/category_item_widget.dart';
import 'package:profitnote/widgets/graph_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final items = [
    {'leftString': '주식', 'rightString': '0원'},
    {'leftString': '생활', 'rightString': '0원'},
    {'leftString': '고정', 'rightString': '0원'},
  ];

  final belowItems = {
    '주식': [
      {'leftString': '버거킹', 'rightString': '10,000원'},
      {'leftString': '푸행크버거', 'rightString': '10,000원'},
      {'leftString': '벙커', 'rightString': '10,000원'},
    ]
  };

  late DateTime _selectedDateTime;
  late String _selectedMonth;
  int _selectedTypeIndex = 0;
  int _pressedIndex = -1;
  String _pressedString = "";

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
    _selectedMonth = DateFormat('yyyy-MM').format(_selectedDateTime);
  }

  void _handlePressed(int index, String leftString) {
    setState(() {
      _pressedIndex = index;
      _pressedString = leftString;
    });
    print('Index: $index, Left String: $leftString');
  }

  void _handleToggle(int index) {
    setState(() {
      _selectedTypeIndex = index;
    });
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
            DateTime nextMonth = DateTime(_selectedDateTime.year,
                _selectedDateTime.month - 1, _selectedDateTime.day);

            if (nextMonth.month > 12) {
              nextMonth = DateTime(
                  nextMonth.year - 1, nextMonth.month + 12, nextMonth.day);
            }
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
            DateTime nextMonth = DateTime(_selectedDateTime.year,
                _selectedDateTime.month + 1, _selectedDateTime.day);

            if (nextMonth.month > 12) {
              nextMonth = DateTime(
                  nextMonth.year + 1, nextMonth.month - 12, nextMonth.day);
            }
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
    if (_pressedIndex < 0) {
      return ToggleButtonsWithSlidingBorder(onPressed: _handleToggle);
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            _pressedIndex = -1;
          });
        },
        child: Container(
          color: ColorTheme.cardBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.chevron_left),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _pressedIndex = -1;
                        });
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
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _buildToggleButton(String text, int index) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  _selectedTypeIndex == index ? Colors.red : Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              _selectedTypeIndex = index;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: ColorTheme.cardBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItems() {
    if (_pressedIndex < 0) {
      return Expanded(
        child: CategoryItemsWidget(
          items: items,
          onPressed: _handlePressed,
        ),
      );
    } else {
      return Expanded(
        child: CategoryItemsWidget(
          items: belowItems[_pressedString]!,
          onPressed: (int index, String leftString) {},
        ),
      );
    }
  }
}
