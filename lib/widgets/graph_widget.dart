import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    return SfCartesianChart(
      // Initialize category axis
      primaryXAxis: const CategoryAxis(),
      series: <LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
          // Bind data source
          dataSource: data,
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
        )
      ],
    );
  }
}
