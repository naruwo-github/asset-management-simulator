import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/material.dart';

class ResultText {
  Text getWidget(int _result, BuildContext _context) {
    return Text(
      '${StringManager().resultTextPrefix}: $_result ${StringManager().currency}',
      style: Theme.of(_context).textTheme.headline4,
    );
  }
}
