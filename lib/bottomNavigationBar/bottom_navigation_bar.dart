import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBottomNavigationBar {

  Column getWidget(BannerAd _bottomBannerAd) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          child: AdWidget(ad: _bottomBannerAd),
          width: _bottomBannerAd.size.width.toDouble(),
          height: _bottomBannerAd.size.height.toDouble(),
        ),
      ],
    );
  }

}