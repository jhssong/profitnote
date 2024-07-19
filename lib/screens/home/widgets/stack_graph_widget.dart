import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetData {
  AssetData(
    this.date,
    this.amount,
    this.asset,
  );

  final DateTime date;
  final double amount;
  final String asset;
}

class StackGraphWidget extends StatelessWidget {
  const StackGraphWidget(
      {super.key, required this.data, required this.selectedAsset});

  final List<AssetData> data;
  final String? selectedAsset;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        toggleSeriesVisibility: false,
      ),
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: TextStyle(color: ColorTheme.cardLabelText),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(color: ColorTheme.cardLabelText),
      ),
      series: _getSeries(),
      tooltipBehavior:
          TooltipBehavior(enable: true, header: '', canShowMarker: false),
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
          opacity: (selectedAsset == null || selectedAsset == asset) ? 0.3 : 1);
    }).toList();
  }
}
