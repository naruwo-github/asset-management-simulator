import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  static const Color saved = Colors.lightGreen;
  static const Color increased = Colors.pinkAccent;

  static List<BarChartGroupData> getData(
    int period,
    double rate,
    List<double> yearSavings,
    BuildContext context,
    int touchedRodStackItemIndex,
  ) {
    List<BarChartGroupData> dataList = [];
    for (int i = 0; i < period; i++) {
      dataList.add(
        BarChartGroupData(
          x: i,
          barsSpace: 5,
          barRods: [
            BarChartRodData(
              width: MediaQuery.of(context).size.width / period / 2,
              y: yearSavings[i] * (1 + rate),
              rodStackItems: [
                BarChartRodStackItem(
                  0,
                  yearSavings[i],
                  saved,
                  BorderSide(
                      color: Colors.orange,
                      width: touchedRodStackItemIndex == i ? 2 : 0),
                ),
                BarChartRodStackItem(
                  yearSavings[i],
                  yearSavings[i] * (1 + rate),
                  increased,
                  BorderSide(
                      color: Colors.orange,
                      width: touchedRodStackItemIndex == i ? 2 : 0),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(3)),
            ),
          ],
        ),
      );
    }

    return dataList;
  }
}
