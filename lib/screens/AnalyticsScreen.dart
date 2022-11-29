import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:sports_flutter_app/screens/ChartModel.dart';
class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      teamName: "South Africa",
      ticketsale: 530,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      teamName: "Austrila",
      ticketsale: 330,
      color: charts.ColorUtil.fromDartColor(Colors.lightGreenAccent),
    ),
    BarChartModel(
      teamName: "India",
      ticketsale: 650,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      teamName: "Srilanka",
      ticketsale: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.teamName,
        measureFn: (BarChartModel series, _) => series.ticketsale,
        colorFn: (BarChartModel series, _) => series.color,
          labelAccessorFn: (BarChartModel series, _) =>
          '${series.ticketsale}: \$${series.ticketsale.toString()}'),
    ];

    return
      SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:Column(
        children: [
          SizedBox(
            height: 600,
            child: charts.BarChart(
              series,
              animate: true,
            ),
          ),
          Text(
            "Average Ticket Sales of Teams",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}