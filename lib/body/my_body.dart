import 'package:asset_management_simulator/body/calculateButton/calculate_button.dart';
import 'package:asset_management_simulator/body/chart/chart.dart';
import 'package:asset_management_simulator/body/resultText/result_text.dart';
import 'package:asset_management_simulator/body/setting/setting.dart';
import 'package:asset_management_simulator/services/admob.dart';
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
                    Chart().getWidget(),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
