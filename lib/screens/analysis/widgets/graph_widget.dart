import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// 임시 데이터
class SalesData {
  SalesData(this.year, this.sales, this.text);
  final String year;
  final double sales;
  final String text;
}

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key, required this.data});

  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<SalesData, String>(
          dataSource: data,
          xValueMapper: (SalesData data, _) => data.year,
          yValueMapper: (SalesData data, _) => data.sales,
          dataLabelMapper: (SalesData data, _) => "${data.year} ${data.text}",
          dataLabelSettings: DataLabelSettings(
            margin: EdgeInsets.zero,
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.curve, length: '20%'),
            labelIntersectAction: LabelIntersectAction.shift,
            textStyle: TextStyle(color: ColorTheme.cardText),
          ),
          radius: '60%',
        ),
      ],
    );
  }
}
