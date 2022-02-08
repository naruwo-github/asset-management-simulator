import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('separateByThreeDigits() test', () {
    var pattern1 = StringManager.separateByThreeDigits('1000000');
    expect(pattern1, '1,000,000');

    var pattern2 = StringManager.separateByThreeDigits('100000');
    expect(pattern2, '100,000');

    var pattern3 = StringManager.separateByThreeDigits('1000');
    expect(pattern3, '1,000');

    var pattern4 = StringManager.separateByThreeDigits('100');
    expect(pattern4, '100');
  });

  test('formatCalculatedResult() test', () {
    const result = 523511;

    var pattern1 = StringManager.formatCalculatedResult(result, '最終積立金額');
    expect(pattern1, '合計: 523,511 円');

    var pattern2 = StringManager.formatCalculatedResult(result, '毎月積立金額');
    expect(pattern2, '毎月: 523,511 円');
  });
}
