import 'package:asset_management_simulator/body/calculateButton/calculate_button.dart';
import 'package:asset_management_simulator/body/resultText/result_text.dart';
import 'package:asset_management_simulator/body/setting/setting.dart';
import 'package:asset_management_simulator/services/admob.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBody {
  SafeArea getWidget(
      String _dropdownValue,
      void Function(String) _setDropdownValue,
      int _monthlySaving,
      void Function(int) _setMonthlySaving,
      int _annualInterestRate,
      void Function(int) _setAnnualInterestRate,
      int _savingPeriod,
      void Function(int) _setSavingPeriod,
      int _calculatedResult,
      void Function() _setCalculatedResult,
      BannerAd _topBannerAd,
      BuildContext _context
      ) {

    const Color dark = Colors.teal;
    const Color normal = Colors.orangeAccent;
    const Color light = Colors.white70;
    List<BarChartGroupData> getData() {
      return [
        BarChartGroupData(
          x: 0,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
                y: 17000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 2000000000, dark),
                  BarChartRodStackItem(2000000000, 12000000000, normal),
                  BarChartRodStackItem(12000000000, 17000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 24000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 13000000000, dark),
                  BarChartRodStackItem(13000000000, 14000000000, normal),
                  BarChartRodStackItem(14000000000, 24000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 23000000000.5,
                rodStackItems: [
                  BarChartRodStackItem(0, 6000000000.5, dark),
                  BarChartRodStackItem(6000000000.5, 18000000000, normal),
                  BarChartRodStackItem(18000000000, 23000000000.5, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 29000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 9000000000, dark),
                  BarChartRodStackItem(9000000000, 15000000000, normal),
                  BarChartRodStackItem(15000000000, 29000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 32000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 2000000000.5, dark),
                  BarChartRodStackItem(2000000000.5, 17000000000.5, normal),
                  BarChartRodStackItem(17000000000.5, 32000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
                y: 31000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 11000000000, dark),
                  BarChartRodStackItem(11000000000, 18000000000, normal),
                  BarChartRodStackItem(18000000000, 31000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 35000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 14000000000, dark),
                  BarChartRodStackItem(14000000000, 27000000000, normal),
                  BarChartRodStackItem(27000000000, 35000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 31000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 8000000000, dark),
                  BarChartRodStackItem(8000000000, 24000000000, normal),
                  BarChartRodStackItem(24000000000, 31000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 15000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 6000000000.5, dark),
                  BarChartRodStackItem(6000000000.5, 12000000000.5, normal),
                  BarChartRodStackItem(12000000000.5, 15000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 17000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 9000000000, dark),
                  BarChartRodStackItem(9000000000, 15000000000, normal),
                  BarChartRodStackItem(15000000000, 17000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
                y: 34000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 6000000000, dark),
                  BarChartRodStackItem(6000000000, 23000000000, normal),
                  BarChartRodStackItem(23000000000, 34000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 32000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 7000000000, dark),
                  BarChartRodStackItem(7000000000, 24000000000, normal),
                  BarChartRodStackItem(24000000000, 32000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 14000000000.5,
                rodStackItems: [
                  BarChartRodStackItem(0, 1000000000.5, dark),
                  BarChartRodStackItem(1000000000.5, 12000000000, normal),
                  BarChartRodStackItem(12000000000, 14000000000.5, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 20000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 4000000000, dark),
                  BarChartRodStackItem(4000000000, 15000000000, normal),
                  BarChartRodStackItem(15000000000, 20000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 24000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 4000000000, dark),
                  BarChartRodStackItem(4000000000, 15000000000, normal),
                  BarChartRodStackItem(15000000000, 24000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
                y: 14000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 1000000000.5, dark),
                  BarChartRodStackItem(1000000000.5, 12000000000, normal),
                  BarChartRodStackItem(12000000000, 14000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 27000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 7000000000, dark),
                  BarChartRodStackItem(7000000000, 25000000000, normal),
                  BarChartRodStackItem(25000000000, 27000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 29000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 6000000000, dark),
                  BarChartRodStackItem(6000000000, 23000000000, normal),
                  BarChartRodStackItem(23000000000, 29000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 16000000000.5,
                rodStackItems: [
                  BarChartRodStackItem(0, 9000000000, dark),
                  BarChartRodStackItem(9000000000, 15000000000, normal),
                  BarChartRodStackItem(15000000000, 16000000000.5, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
            BarChartRodData(
                y: 15000000000,
                rodStackItems: [
                  BarChartRodStackItem(0, 7000000000, dark),
                  BarChartRodStackItem(7000000000, 12000000000.5, normal),
                  BarChartRodStackItem(12000000000.5, 15000000000, light),
                ],
                borderRadius: const BorderRadius.all(Radius.zero)),
          ],
        ),
      ];
    }

    return SafeArea(
      child: Column(
        children: [
          AdMobService().getBannerAdContainer(_topBannerAd),
          Expanded(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Setting().getWidget(
                      _dropdownValue, _setDropdownValue,
                      _monthlySaving, _setMonthlySaving,
                      _annualInterestRate, _setAnnualInterestRate,
                      _savingPeriod, _setSavingPeriod,
                    ),
                    CalculateButton().getWidget(_setCalculatedResult),
                    ResultText().getWidget(_calculatedResult, _context),
                    AspectRatio(
                      aspectRatio: 1.66,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.center,
                              barTouchData: BarTouchData(
                                enabled: false,
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (context, value) =>
                                  const TextStyle(color: Colors.grey, fontSize: 10),
                                  margin: 10,
                                  getTitles: (double value) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return 'Apr';
                                      case 1:
                                        return 'May';
                                      case 2:
                                        return 'Jun';
                                      case 3:
                                        return 'Jul';
                                      case 4:
                                        return 'Aug';
                                      default:
                                        return '';
                                    }
                                  },
                                ),
                                leftTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  getTextStyles: (context, value) => const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10
                                  ),
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
                              barGroups: getData(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
