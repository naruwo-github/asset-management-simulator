import 'package:asset_management_simulator/body/calculate_button.dart';
import 'package:asset_management_simulator/body/setting.dart';
import 'package:asset_management_simulator/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBody {
  SafeArea getWidget(
      String _dropdownValue,
      void Function(String) _setDropdownValue,
      int _counter,
      void Function() _incrementCounter,
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
                    CalculateButton().getWidget(_incrementCounter),
                    Text(
                      'Result: $_counter',
                      style: Theme.of(_context).textTheme.headline4,
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}