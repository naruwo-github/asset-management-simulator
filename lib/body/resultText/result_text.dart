import 'package:flutter/material.dart';

class ResultText {
  static Text getWidget(String _calculatedResult, BuildContext _context) {
    return Text(
      _calculatedResult,
      style: Theme.of(_context).textTheme.headline4,
    );
  }
}
