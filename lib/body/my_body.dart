import 'package:asset_management_simulator/body/calculateButton/calculate_button.dart';
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
      int _result,
      void Function() _calculateResult,
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
                    Setting().getWidget(_dropdownValue, _setDropdownValue),
                    CalculateButton().getWidget(_calculateResult),
                    ResultText().getWidget(_result, _context)
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}