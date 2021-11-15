import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  static const Color saved = Colors.amber;
  static const Color increased = Colors.cyan;

  List<BarChartGroupData> getData(
    int _monthlySaving,
    int _annualInterestRate,
    int _savingPeriod,
    void Function(int) _setCalculated,
  ) {
    double yearSaving = _monthlySaving * 10000 * 12;
    double rate = _annualInterestRate / 100;
    int period = _savingPeriod;

    // TODO: Maybe, this loop isn't necessary...
    List<double> yearSavings = [yearSaving];
    for (int i = 1; i < period; i++) {
      yearSavings.add(yearSavings[i - 1] * (1 + rate) + yearSaving);
    }
    _setCalculated((yearSavings.last * (1 + rate)).toInt());

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
