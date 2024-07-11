import 'package:flutter/material.dart';
import 'package:profitnote/screens/home/widgets/asset_item_widget.dart';
import 'package:profitnote/screens/home/widgets/spline_graph_widget.dart';
import 'package:profitnote/style/theme.dart';

class AssetAnalysisScreen extends StatefulWidget {
  const AssetAnalysisScreen({super.key});

  @override
  State<AssetAnalysisScreen> createState() => _AssetAnalysisScreenState();
}

class _AssetAnalysisScreenState extends State<AssetAnalysisScreen> {
  final data = [
    AssetData(DateTime(2024, 1), 400, 'Asset 1'),
    AssetData(DateTime(2024, 2), 600, 'Asset 1'),
    AssetData(DateTime(2024, 3), 800, 'Asset 1'),
    AssetData(DateTime(2024, 4), 400, 'Asset 1'),
    AssetData(DateTime(2024, 5), 600, 'Asset 1'),
    AssetData(DateTime(2024, 6), 800, 'Asset 1'),
    AssetData(DateTime(2024, 1), 400, 'Asset 2'),
    AssetData(DateTime(2024, 2), 600, 'Asset 2'),
    AssetData(DateTime(2024, 3), 800, 'Asset 2'),
    AssetData(DateTime(2024, 4), 200, 'Asset 2'),
    AssetData(DateTime(2024, 5), 300, 'Asset 2'),
    AssetData(DateTime(2024, 6), 500, 'Asset 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산 분석"),
        actions: const [],
      ),
      body: Column(
        children: [
          SplineGraphWidget(
            data: data,
          ),
          Text(
            "자산 선택",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(height: 2, color: ColorTheme.cardLabelText),
          Expanded(
            child: AssetItemWidget(
              items: [
                AssetData(DateTime(2024, 6), 500, 'Asset 1'),
                AssetData(DateTime(2024, 6), 800, 'Asset 2'),
              ],
              onPressed: (int index, String description) {},
            ),
          ),
        ],
      ),
    );
  }
}
