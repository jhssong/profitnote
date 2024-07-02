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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: ColorTheme.cardBackground,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "수입",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: ColorTheme.cardBackground,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "지출",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CategoryItemsWidget(items: items),
          ),
        ],
      ),
    );
  }
}
