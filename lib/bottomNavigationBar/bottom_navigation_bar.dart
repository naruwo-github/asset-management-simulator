import 'package:asset_management_simulator/services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBottomNavigationBar {
  static Column getWidget(BannerAd _bottomBannerAd) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        AdMobService().getBannerAdContainer(_bottomBannerAd),
      ],
    );
  }
}
