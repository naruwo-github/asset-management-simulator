import 'package:flutter/material.dart';

class ResultText {
  Text getWidget(int _result, BuildContext _context) {
    return Text(
      'Result: $_result',
      style: Theme.of(_context).textTheme.headline4,
    );
  }
}
