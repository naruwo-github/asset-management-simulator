import 'package:flutter/material.dart';

class ResultText {
  static Text getWidget(String calculatedResult, BuildContext context) {
    return Text(
      calculatedResult,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
