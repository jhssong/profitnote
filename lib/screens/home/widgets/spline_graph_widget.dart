import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetData {
  AssetData(this.date, this.amount, this.asset);

  final DateTime date;
  final double amount;
  final String asset;
}

class SplineGraphWidget extends StatelessWidget {
  const SplineGraphWidget({super.key, required this.data});

  final List<AssetData> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(),
      series: _getSeries(),
    );
  }

  List<StackedAreaSeries<AssetData, DateTime>> _getSeries() {
    final assets = data.map((d) => d.asset).toSet().toList();
    return assets.map((asset) {
      final assetData = data.where((d) => d.asset == asset).toList();
      return StackedAreaSeries<AssetData, DateTime>(
        dataSource: assetData,
        xValueMapper: (AssetData data, _) => data.date,
        yValueMapper: (AssetData data, _) => data.amount,
        dataLabelMapper: (AssetData data, _) =>
            "${data.date.month}/${data.date.year} ${data.amount}",
        dataLabelSettings: const DataLabelSettings(
          margin: EdgeInsets.zero,
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          connectorLineSettings:
              ConnectorLineSettings(type: ConnectorType.curve, length: '20%'),
          labelIntersectAction: LabelIntersectAction.shift,
          textStyle: TextStyle(color: Colors.black), // Example color
        ),
      );
    }).toList();
  }
}
