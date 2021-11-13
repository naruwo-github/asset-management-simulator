import 'package:flutter/material.dart';

class SettingElementUnit {

  Row getWidget(
      String title,
      int defaultValue,
      void Function(int) setIntValue,
      ) {
    return Row(
      children: <Widget>[
        Text(title),
        DropdownButton(
          value: defaultValue,
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(
              color: Colors.black
          ),
          underline: Container(
            height: 2,
            color: Colors.lightGreenAccent,
          ),
          onChanged: (Object? newValue) {
            setIntValue(newValue! as int);
          },
          items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 25, 30, 50, 100]
              .map((int item) {
            return DropdownMenuItem(
                value: item,
                child: Text(item.toString())
            );
          })
              .toList(),
        ),
      ],
    );
  }

}