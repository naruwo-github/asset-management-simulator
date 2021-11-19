import 'package:asset_management_simulator/body/my_body.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:asset_management_simulator/appBar/app_bar.dart';
import 'package:asset_management_simulator/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:asset_management_simulator/services/admob.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

// Root widget of this app.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringManager.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: StringManager.appTitle),
    );
  }
}

// Home page widget of this app.
// Stateful: A method in which the system retains data representing the current state
// and reflects the contents in processing.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BannerAd _topBannerAd =
      AdMobService.getBannerAdByType(AdType.topBanner);
  final BannerAd _bottomBannerAd =
      AdMobService.getBannerAdByType(AdType.bottomBanner);

  // *** State ***
  String _dropdownValue = StringManager.dropdownValues.first;
  String _calculatedResult = ''; // 計算結果

  // *** 金額の単位：万 ***
  int _monthlySaving = 3; // 毎月の積立金額
  int _annualInterestRate = 3; // 利回り（年率）
  int _savingPeriod = 10; // 積立期間
  int _targetAmount = 2000; // 目標金額
  // *** 金額の単位：円 ***
  int _calculatedSavingAmountPerMonth = 0; // 毎月積み立てる必要のある額
  // *** 積立期間の単位：ヶ月 ***
  // TODO: *** アップデート ***
  int _calculatedSavingPeriod = 0; // 積立に必要な月数
  // TODO: *** アップデート ***

  // *** setState ***
  void _setDropdownValue(String value) {
    setState(() {
      _dropdownValue = value;
      calculateResult();
    });
  }

  void _setMonthlySaving(int value) {
    setState(() {
      _monthlySaving = value;
      calculateResult();
    });
  }

  void _setAnnualInterestRate(int value) {
    setState(() {
      _annualInterestRate = value;
      calculateResult();
    });
  }

  void _setSavingPeriod(int value) {
    setState(() {
      _savingPeriod = value;
      calculateResult();
    });
  }

  void _setTargetAmount(int value) {
    setState(() {
      _targetAmount = value;
    });
  }

  void calculateResult() {
    // Should be called in setState().
    if (_dropdownValue == StringManager.dropdownValues.first) {
      // 積立金額/月、利回り、積立期間から最終積立金額を算出
      double resultAmount = 0;
      for (int i = 0; i < _savingPeriod; i++) {
        resultAmount = (resultAmount + (_monthlySaving * 10000 * 12)) *
            (1 + _annualInterestRate / 100);
      }
      _calculatedResult = StringManager.formatCalculatedResult(resultAmount.toInt(), _dropdownValue);
    }
    if (_dropdownValue == StringManager.dropdownValues[1]) {
      // 積立期間、利回り、目標金額から積立金額/月を算出
      double rate = 1 + _annualInterestRate / 100;
      double welfare = rate;
      for (int i = 1; i < _savingPeriod; i++) {
        welfare = rate * (welfare + 1);
      }
      double resultMonthlySaving = _targetAmount * 10000 / 12 / welfare;
      _calculatedSavingAmountPerMonth = resultMonthlySaving.toInt();
      _calculatedResult = StringManager.formatCalculatedResult(resultMonthlySaving.toInt(), _dropdownValue);
    }
    // TODO: *** アップデート ***
    // if (_dropdownValue == StringManager.dropdownValues.last) {
    //   // TODO: 積立金額/月、利回り、目標金額から積立期間を算出
    // }
    // TODO: *** アップデート ***
  }

  @override
  void initState() {
    super.initState();
    _topBannerAd.load();
    _bottomBannerAd.load();
    calculateResult();
  }

  @override
  void dispose() {
    super.dispose();
    _topBannerAd.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: MyAppBar.getWidget(widget.title),
      body: MyBody.getWidget(
          _dropdownValue,
          _setDropdownValue,
          _monthlySaving,
          _setMonthlySaving,
          _annualInterestRate,
          _setAnnualInterestRate,
          _savingPeriod,
          _setSavingPeriod,
          _targetAmount,
          _setTargetAmount,
          _calculatedSavingAmountPerMonth,
          _calculatedResult,
          _topBannerAd,
          context),
      bottomNavigationBar: MyBottomNavigationBar.getWidget(_bottomBannerAd),
    );
  }
}
