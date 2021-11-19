class StringManager {
  static String appTitle = '資産運用シミュレータ';

  // unit
  static String year = '年';
  static String currency = '円';
  static String rate = '%';
  static String monthlySavingUnit = '万円';

  // setting
  static List<String> dropdownValues = ['最終積立金額', '毎月積立金額', '積立期間'];
  static String monthlySaving = '毎月の積立金額';
  static String annualInterestRate = '利回り（年率）';
  static String savingPeriod = '積立期間';
  static String targetAmount = '目標金額';

  // result
  static String resultTextPrefix = '推定額';
  static String disclaimerTitle = '＊免責事項';
  static String disclaimerContent = '【免責事項】\n'
      '・この結果は概算値です。手数料や税金を考慮しておらず、実際の金額と異なる場合があります。\n'
      '・本シミュレーションは、将来の運用成果を保証するものではありません。\n'
      '・本シミュレーションは、特定の金融商品の取引を推奨し、勧誘するものではありません。\n'
      '・本シミュレーションは、その内容の正確性、完全性、信頼性等を保証するものではありません。\n'
      '・本シミュレーションの内容については、予告なく変更される場合があります。\n'
      '・本シミュレーション及び掲載された情報を利用することで生じるいかなる損害（直接的、間接的を問わず）についても、当方は一切の責任を負うものではありません。実際の資産運用や投資判断に当たっては、必ずご自身の責任において最終的に判断してください。';

  // chart
  static String barChartLeftAxisTitle = '合計金額';

  // 金額を3桁ごとに,で区切る
  static String separateByThreeDigits(String text) {
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

  // 結果のテキストを整形する関数
  static String formatCalculatedResult(int result, String _dropdownValue) {
    String formattedResult = separateByThreeDigits(result.toString());
    if (_dropdownValue == dropdownValues.first) {
      // 例: 推定額: 523,511 円
      return '$resultTextPrefix: $formattedResult $currency';
    }
    if (_dropdownValue == dropdownValues[1]) {
      // 例: 推定額: 523,511 円
      return '$resultTextPrefix: $formattedResult $currency';// TODO: 一つ上の条件式と被ってる
    }
    if (_dropdownValue == dropdownValues.last) {
      // 例: 推定期間: 10年1ヶ月
      return '実装中...';// TODO: 実装中...
    }
    return '';
  }

}
