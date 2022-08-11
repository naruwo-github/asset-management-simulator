import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum AdType {
  topBanner,
  bottomBanner,
}

class AdMobService {
  // バナー広告のウィジェットを作成する関数
  static Container getBannerAdContainer(BannerAd bannerAd) {
    return Container(
      alignment: Alignment.center,
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
  }

  // バナー広告のインスタンスを作成する関数
  static BannerAd getBannerAdByType(AdType type) {
    String adId = getTopBannerAdUnitId();
    if (type == AdType.bottomBanner) {
      adId = getBottomBannerAdUnitId();
    }
    return BannerAd(
      adUnitId: adId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

  static String getTopBannerAdUnitId() {
    if (Platform.isAndroid) {
      // 本番用バナー広告ID
      return 'ca-app-pub-6492692627915720/3625775502';
    } else if (Platform.isIOS) {
      // 本番用バナー広告ID
      return 'ca-app-pub-6492692627915720/6817053239';
    }
    // テスト用バナー広告ID
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  static String getBottomBannerAdUnitId() {
    if (Platform.isAndroid) {
      // 本番用バナー広告ID
      return 'ca-app-pub-6492692627915720/1482827896';
    } else if (Platform.isIOS) {
      // 本番用バナー広告ID
      return 'ca-app-pub-6492692627915720/6269424177';
    }
    // テスト用バナー広告ID
    return 'ca-app-pub-3940256099942544/6300978111';
  }
}
