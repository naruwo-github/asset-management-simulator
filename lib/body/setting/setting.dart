import 'package:asset_management_simulator/body/setting/setting_element_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  Row getWidget(
    String _dropdownValue,
    void Function(String) _setDropdownValue,
    int _monthlySaving,
    void Function(int) _setMonthlySaving,
    int _annualInterestRate,
    void Function(int) _setAnnualInterestRate,
    int _savingPeriod,
    void Function(int) _setSavingPeriod,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DropdownButton(
          value: _dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(color: Colors.lightGreen),
          underline: Container(
            height: 2,
            color: Colors.lightGreenAccent,
          ),
          onChanged: (Object? newValue) {
            _setDropdownValue(newValue.toString());
          },
          items: ['Predicted Amount', 'Amount/Month', 'Needed Years']
              .map((String item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
        ),
        Container(
          color: Colors.lightGreen,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SettingElementUnit().getWidget(
                'Monthly Saving',
                _monthlySaving,
                _setMonthlySaving,
                '\$',
              ),
              SettingElementUnit().getWidget(
                'Annual Interest Rate',
                _annualInterestRate,
                _setAnnualInterestRate,
                '%',
              ),
              SettingElementUnit().getWidget(
                  'Saving Period', _savingPeriod, _setSavingPeriod, 'Y'),
            ],
          ),
        ),
      ],
    );
  }
}
