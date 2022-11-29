import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String teamName;
  int ticketsale;
  final charts.Color color;

  BarChartModel({
    required this.teamName,
    required this.ticketsale,
    required this.color,
  });
}