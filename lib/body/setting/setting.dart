import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {

  Row getWidget(
      String _dropdownValue,
      void Function(String) _setDropdownValue
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton(
          value: _dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(
              color: Colors.lightGreen
          ),
          underline: Container(
            height: 2,
            color: Colors.lightGreenAccent,
          ),
          onChanged: (Object? newValue) {
            _setDropdownValue(newValue.toString());
          },
          items: ['Predicted Amount', 'Amount/Month', 'Needed Years']
              .map((String item) {
            return DropdownMenuItem(
                value: item,
                child: Text(item)
            );
          })
              .toList(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('AAA'),
            Text('BBB'),
            Text('CCC'),
          ],
        ),
      ],
    );
  }

}