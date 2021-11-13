import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {

  BannerAd getBannerAdById(String adId) {
    return BannerAd(
      adUnitId: adId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

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

}