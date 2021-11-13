import 'package:asset_management_simulator/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBody {
  SafeArea getWidget(BannerAd _topBannerAd, int _counter, BuildContext _context) {
    return SafeArea(
      child: Column(
        children: [
          AdMobService().getBannerAdContainer(_topBannerAd),
          Expanded(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
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