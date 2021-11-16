import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  static const Color saved = Colors.lightBlueAccent;
  static const Color increased = Colors.pinkAccent;

  static List<BarChartGroupData> getData(
      int period,
      double rate,
      List<double> yearSavings,
  ) {
    List<BarChartGroupData> dataList = [];
    for (int i = 0; i < period; i++) {
      dataList.add(
        BarChartGroupData(
          x: i,
          barsSpace: 5,
          barRods: [
            BarChartRodData(
              y: yearSavings[i] * (1 + rate),
              rodStackItems: [
                BarChartRodStackItem(0, yearSavings[i], saved),
                BarChartRodStackItem(
                    yearSavings[i], yearSavings[i] * (1 + rate), increased),
              ],
              borderRadius: const BorderRadius.all(Radius.zero),
            ),
          ],
        ),
      );
    }

    return dataList;
  }
}
