import 'package:flutter/material.dart';

class CalculateButton {
  ElevatedButton getWidget(void Function() _action) {
    return ElevatedButton(
      onPressed: _action,
      child: const Text('Calculate!'),
    );
  }
}
