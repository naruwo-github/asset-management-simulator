import 'package:asset_management_simulator/body/chart/data.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart {
  static AspectRatio getWidget(
    int savingPeriod,
    double rate,
    List<double> yearSavings,
    BuildContext _context,
  ) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: false,// TODO: ここにグラフのタッチイベントを追加する
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.grey, fontSize: 10),
                  rotateAngle: 90,
                  margin: 10,
                  getTitles: (double value) {
                    // Add 1 because of zero index.
                    return '${value.toInt() + 1} ${StringManager.year}';
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.grey, fontSize: 10),
                  margin: 0,
                ),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.black12,
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 4,
              barGroups: ChartData.getData(
                savingPeriod,
                rate,
                yearSavings,
                _context,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
