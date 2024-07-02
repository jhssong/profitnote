import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_item_widget.dart';
import 'package:profitnote/widgets/graph_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final items = [
    {'leftString': 'Item 1', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 3', 'rightString': '₩ 1000'},
    {'leftString': 'Item 4', 'rightString': '₩ 1000'},
    {'leftString': 'Item 5', 'rightString': '₩ 1000'},
  ];

  final belowItems = {
    'Item 1': [
      {'leftString': 'Item 1 of 1', 'rightString': '₩ 100'},
      {'leftString': 'Item 1 of 2', 'rightString': '₩ 100'},
      {'leftString': 'Item 1 of 3', 'rightString': '₩ 100'},
      {'leftString': 'Item 1 of 4', 'rightString': '₩ 100'},
      {'leftString': 'Item 1 of 5', 'rightString': '₩ 100'},
    ]
  };
  int _pressedIndex = -1;
  String _pressedString = "";
  void _handlePressed(int index, String leftString) {
    setState(() {
      _pressedIndex = index;
      _pressedString = leftString;
    });
    print('Index: $index, Left String: $leftString');
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      SalesData('Jan', 35),
      SalesData('Feb', 28),
      SalesData('Mar', 34),
      SalesData('Apr', 32),
      SalesData('May', 40),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('통계 화면'),
      ),
      body: Column(
        children: [
          GraphWidget(data: data),
          _buildToggleRow(),
          _buildCategoryItems(),
        ],
      ),
    );
  }

  Widget _buildToggleRow() {
    if (_pressedIndex < 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToggleButton("수입", () {}),
          _buildToggleButton("지출", () {}),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToggleButton("Back", () {
            setState(() {
              _pressedIndex = -1;
            });
          }),
          _buildToggleButton(_pressedString, () {}),
        ],
      );
    }
  }

  Widget _buildToggleButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorTheme.cardBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
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
