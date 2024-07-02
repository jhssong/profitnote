import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// 임시 데이터
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key, required this.data});

  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        // Initialize category axis
        onDataLabelRender: (DataLabelRenderArgs args) {
          double value = double.parse(args.text!);
          args.text = value.toStringAsFixed(0);
        },
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<SalesData, String>(
            selectionBehavior: SelectionBehavior(enable: true),
            dataSource: data,
            explode: true,
            xValueMapper: (SalesData data, _) => data.year,
            yValueMapper: (SalesData data, _) => data.sales,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
          ),
        ]);
  }
}
