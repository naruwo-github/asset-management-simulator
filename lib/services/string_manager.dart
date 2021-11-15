class StringManager {
  String appTitle = '資産運用シミュレータ';

  // unit
  String year = '年';
  String currency = '円';
  String rate = '%';
  String monthlySavingUnit = '万円';

  // setting
  List<String> dropdownValues = ['最終積立金額', '毎月積立金額', '積立期間'];
  String monthlySaving = '毎月の積立金額';
  String annualInterestRate = '利回り（年率）';
  String savingPeriod = '積立期間';
  String targetAmount = '目標金額';

  // result
  String resultTextPrefix = '推定';

  // chart
  String barChartLeftAxisTitle = '合計金額';

  // 金額を3桁ごとに,で区切る
  String separateByThreeDigits(String text) {
    if (text.length < 3) {
      return text;
    }
    String rtnText = '';
    for (int i = 0; i < text.length; i++) {
      if (i != 0 && i % 3 == 0) {
        rtnText += ',';
      }
      // 後ろから入れていく
      rtnText += text[text.length - 1 - i];
    }
    // 後ろから入れたので、逆にする
    return String.fromCharCodes(rtnText.runes.toList().reversed);
  }
}
