class StringManager {
  String appTitle = '資産運用シミュレータ';

  // unit
  String year = '年';
  String currency = '円';
  String rate = '%';
  String monthlySavingUnit = '万円';

  // setting
  // List<String> dropdownValues = ['最終積立金額', '毎月積立金額', '積立期間']; // TODO: aaa
  List<String> dropdownValues = ['最終積立金額'];
  String monthlySaving = '毎月の積立金額';
  String annualInterestRate = '利回り（年率）';
  String savingPeriod = '積立期間';
  String targetAmount = '目標金額';

  // result
  String resultTextPrefix = '推定額';
  String disclaimerTitle = '＊免責事項';
  String disclaimerContent = '【免責事項】\n'
      '・この結果は概算値です。手数料や税金を考慮しておらず、実際の金額と異なる場合があります。\n'
      '・本シミュレーションは、将来の運用成果を保証するものではありません。\n'
      '・本シミュレーションは、特定の金融商品の取引を推奨し、勧誘するものではありません。\n'
      '・本シミュレーションは、その内容の正確性、完全性、信頼性等を保証するものではありません。\n'
      '・本シミュレーションの内容については、予告なく変更される場合があります。\n'
      '・本シミュレーション及び掲載された情報を利用することで生じるいかなる損害（直接的、間接的を問わず）についても、当方は一切の責任を負うものではありません。実際の資産運用や投資判断に当たっては、必ずご自身の責任において最終的に判断してください。';

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
