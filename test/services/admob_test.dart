import 'package:asset_management_simulator/services/admob.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const bannerAdTestId = 'ca-app-pub-3940256099942544/6300978111';
  test('Top banner ad id test', () {
    var topBannerId = AdMobService.getTopBannerAdUnitId();
    expect(topBannerId, bannerAdTestId);
  });
  test('Bottom banner ad id test', () {
    var bottomBannerId = AdMobService.getBottomBannerAdUnitId();
    expect(bottomBannerId, bannerAdTestId);
  });
}
