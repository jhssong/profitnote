import 'package:flutter/material.dart';
import 'package:profitnote/screens/home/widgets/spline_graph_widget.dart';

class AssetAnalysisScreen extends StatefulWidget {
  const AssetAnalysisScreen({super.key});

  @override
  State<AssetAnalysisScreen> createState() => _AssetAnalysisScreenState();
}

class _AssetAnalysisScreenState extends State<AssetAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산 분석"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: SplineGraphWidget(
          data: [
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
          ],
        ),
      ),
    );
  }
}
