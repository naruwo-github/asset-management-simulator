import 'package:asset_management_simulator/body/chart/chart.dart';
import 'package:asset_management_simulator/body/resultText/result_text.dart';
import 'package:asset_management_simulator/body/setting/setting.dart';
import 'package:asset_management_simulator/services/admob.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBody {
  static SafeArea getWidget(
      String dropdownValue,
      void Function(String) setDropdownValue,
      int monthlySaving,
      void Function(int) setMonthlySaving,
      int annualInterestRate,
      void Function(int) setAnnualInterestRate,
      int savingPeriod,
      void Function(int) setSavingPeriod,
      int targetAmount,
      void Function(int) setTargetAmount,
      int calculatedSavingAmountPerMonth,
      String calculatedResult,
      BannerAd topBannerAd,
      BuildContext context,
      int touchedRodStackItemIndex,
      void Function(int) setTouchedRodStackItemIndex,
      ) {
    int monthlySavingAmount = monthlySaving;
    if (dropdownValue == StringManager.dropdownValues[1]) {
      // 「毎月積立金額」を求める場合、値は算出されたものを使う
      monthlySavingAmount = calculatedSavingAmountPerMonth;
    }
    // Calculate data to show on chart.
    double yearSaving = monthlySavingAmount * 10000 * 12;
    double rate = annualInterestRate / 100;
    List<double> yearSavings = [yearSaving];
    for (int i = 1; i < savingPeriod; i++) {
      yearSavings.add(yearSavings[i - 1] * (1 + rate) + yearSaving);
    }

    return SafeArea(
      child: Column(
        children: [
          AdMobService.getBannerAdContainer(topBannerAd),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Chart.getWidget(
                    savingPeriod,
                    rate,
                    yearSavings,
                    context,
                    touchedRodStackItemIndex,
                    setTouchedRodStackItemIndex,
                  ),
                  Setting.getWidget(
                    dropdownValue,
                    setDropdownValue,
                    monthlySaving,
                    setMonthlySaving,
                    annualInterestRate,
                    setAnnualInterestRate,
                    savingPeriod,
                    setSavingPeriod,
                    targetAmount,
                    setTargetAmount,
                  ),
                  ResultText.getWidget(
                    calculatedResult,
                    context,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                StringManager.disclaimerContent,
                                // バナー広告を隠さないサイズを指定
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          });
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    child: Text(StringManager.disclaimerTitle),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
