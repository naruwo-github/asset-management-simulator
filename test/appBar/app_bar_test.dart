import 'package:asset_management_simulator/appBar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('MyAppBar test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(MyAppBar.getWidget('title')));
    expect(find.text('title'), findsOneWidget);
    expect(find.text('no_title'), findsNothing);
  });
}
