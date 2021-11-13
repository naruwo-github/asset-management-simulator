import 'dart:io';
import 'package:flutter/material.dart';

class AdMobService {
  String getTopBannerAdUnitId() {
    // TODO: 本番ではコメントアウト解除
    // if (Platform.isAndroid) {
    //   // 本番用バナー広告ID
    //   return 'ca-app-pub-6492692627915720/3625775502';
    // } else if (Platform.isIOS) {
    //   // 本番用バナー広告ID
    //   return 'ca-app-pub-6492692627915720/6817053239';
    // }
    // テスト用バナー広告ID
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  String getBottomBannerAdUnitId() {
    // TODO: 本番ではコメントアウト解除
    // if (Platform.isAndroid) {
    //   // 本番用バナー広告ID
    //   return 'ca-app-pub-6492692627915720/1482827896';
    // } else if (Platform.isIOS) {
    //   // 本番用バナー広告ID
    //   return 'ca-app-pub-6492692627915720/6269424177';
    // }
    // テスト用バナー広告ID
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  double getBannerAdHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return (height * 0.06).toDouble();
  }
}