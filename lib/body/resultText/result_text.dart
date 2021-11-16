import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/material.dart';

class ResultText {
  Text getWidget(int _calculatedResult, BuildContext _context) {
    String formattedResult =
        StringManager().separateByThreeDigits(_calculatedResult.toString());
    return Text(
      '${StringManager().resultTextPrefix}: $formattedResult ${StringManager().currency}',
      style: Theme.of(_context).textTheme.headline4,
    );
  }
}
