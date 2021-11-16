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
      title: StringManager().appTitle,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: StringManager().appTitle),
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
      AdMobService().getBannerAdByType(AdType.topBanner);
  final BannerAd _bottomBannerAd =
      AdMobService().getBannerAdByType(AdType.bottomBanner);

  // *** State ***
  String _dropdownValue = StringManager().dropdownValues.first;

  // *** 金額の単位：万 ***
  int _monthlySaving = 2; // 毎月の積立金額
  int _annualInterestRate = 3; // 利回り（年率）
  int _savingPeriod = 5; // 積立期間
  int _targetAmount = 1000; // 目標金額
  int _calculatedResult = 0; // 計算結果

  // *** setState ***
  void _setDropdownValue(String value) {
    setState(() {
      _dropdownValue = value;
    });
  }

  void _setMonthlySaving(int value) {
    setState(() {
      _monthlySaving = value;
    });
  }

  void _setAnnualInterestRate(int value) {
    setState(() {
      _annualInterestRate = value;
    });
  }

  void _setSavingPeriod(int value) {
    setState(() {
      _savingPeriod = value;
    });
  }

  void _setTargetAmount(int value) {
    setState(() {
      _targetAmount = value;
    });
  }

  void _setCalculatedResult(int value) {
    setState(() {
      _calculatedResult = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _topBannerAd.load();
    _bottomBannerAd.load();
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
      appBar: MyAppBar().getWidget(widget.title),
      body: MyBody().getWidget(
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
          _calculatedResult,
          _setCalculatedResult,
          _topBannerAd,
          context),
      bottomNavigationBar: MyBottomNavigationBar().getWidget(_bottomBannerAd),
    );
  }
}
