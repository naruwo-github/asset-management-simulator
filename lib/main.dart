import 'package:asset_management_simulator/body/my_body.dart';
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
      title: 'Asset Management Simulator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Asset Management Simulator'),
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
  int _counter = 0;
  final BannerAd _topBannerAd = AdMobService().getBannerAdByType(AdType.top);
  final BannerAd _bottomBannerAd = AdMobService().getBannerAdByType(AdType.bottom);

  void _incrementCounter() {
    setState(() {
      _counter++;
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
      body: MyBody().getWidget(_topBannerAd, _counter, context),
      bottomNavigationBar: MyBottomNavigationBar().getWidget(_bottomBannerAd),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
