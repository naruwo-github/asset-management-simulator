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
      int _targetAmount, // TODO: not using
      void Function(int) _setTargetAmount, // TODO: not using
      String _calculatedResult,
      BannerAd _topBannerAd,
      BuildContext _context) {
    // Calculate data to show on chart.
    double yearSaving = _monthlySaving * 10000 * 12;
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
                      primary: Colors.black,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.orange),
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
