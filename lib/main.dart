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
  final BannerAd _topBannerAd = AdMobService().getBannerAdById(AdMobService().getTopBannerAdUnitId());
  final BannerAd _bottomBannerAd = AdMobService().getBannerAdById(AdMobService().getBottomBannerAdUnitId());

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: _topBannerAd),
              width: _topBannerAd.size.width.toDouble(),
              height: _topBannerAd.size.height.toDouble(),
            ),
            Expanded(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar().getWidget(_bottomBannerAd),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
