import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar getWidget(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
