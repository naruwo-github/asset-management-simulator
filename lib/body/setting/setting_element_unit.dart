import 'package:flutter/material.dart';

class SettingElementUnit {
  static Row getWidget(
    String title,
    int defaultValue,
    void Function(int) setIntValue,
    List<int> items,
    String unit,
  ) {
    return Row(
      children: <Widget>[
        Text(title),
        DropdownButton(
          value: defaultValue,
          alignment: Alignment.bottomRight,
          icon: const Icon(Icons.arrow_downward),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (Object? newValue) {
            setIntValue(newValue! as int);
          },
          items: items.map((int item) {
            return DropdownMenuItem(value: item, child: Text(item.toString()));
          }).toList(),
        ),
        Text(unit),
      ],
    );
  }
}
