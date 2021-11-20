import 'package:asset_management_simulator/body/chart/chart.dart';
import 'package:asset_management_simulator/body/resultText/result_text.dart';
import 'package:asset_management_simulator/body/setting/setting.dart';
import 'package:asset_management_simulator/services/admob.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBody {
  static SafeArea getWidget(
      String _dropdownValue,
      void Function(String) _setDropdownValue,
      int _monthlySaving,
      void Function(int) _setMonthlySaving,
      int _annualInterestRate,
      void Function(int) _setAnnualInterestRate,
      int _savingPeriod,
      void Function(int) _setSavingPeriod,
      int _targetAmount,
      void Function(int) _setTargetAmount,
      int _calculatedSavingAmountPerMonth,
      String _calculatedResult,
      BannerAd _topBannerAd,
      BuildContext _context,
      int _touchedRodStackItemIndex,
      void Function(int) _setTouchedRodStackItemIndex,
      ) {
    int monthlySavingAmount = _monthlySaving;
    if (_dropdownValue == StringManager.dropdownValues[1]) {
      // 「毎月積立金額」を求める場合、値は算出されたものを使う
      monthlySavingAmount = _calculatedSavingAmountPerMonth;
    }
    // Calculate data to show on chart.
    double yearSaving = monthlySavingAmount * 10000 * 12;
    double rate = _annualInterestRate / 100;
    List<double> yearSavings = [yearSaving];
    for (int i = 1; i < _savingPeriod; i++) {
      yearSavings.add(yearSavings[i - 1] * (1 + rate) + yearSaving);
    }

    return SafeArea(
      child: Column(
        children: [
          AdMobService.getBannerAdContainer(_topBannerAd),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Chart.getWidget(
                    _savingPeriod,
                    rate,
                    yearSavings,
                    _context,
                    _touchedRodStackItemIndex,
                    _setTouchedRodStackItemIndex,
                  ),
                  Setting.getWidget(
                    _dropdownValue,
                    _setDropdownValue,
                    _monthlySaving,
                    _setMonthlySaving,
                    _annualInterestRate,
                    _setAnnualInterestRate,
                    _savingPeriod,
                    _setSavingPeriod,
                    _targetAmount,
                    _setTargetAmount,
                  ),
                  ResultText.getWidget(
                    _calculatedResult,
                    _context,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                          context: _context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(StringManager.disclaimerContent),
                            );
                          });
                    },
                    child: Text(StringManager.disclaimerTitle),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
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
