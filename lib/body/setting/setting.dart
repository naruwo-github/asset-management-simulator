import 'package:asset_management_simulator/body/setting/setting_element_unit.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  static Row getWidget(
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
          style: const TextStyle(color: Colors.orange),
          underline: Container(
            height: 2,
            color: Colors.orangeAccent,
          ),
          onChanged: (Object? newValue) {
            _setDropdownValue(newValue.toString());
          },
          items: StringManager.dropdownValues.map((String item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
        ),
        Container(
          color: Colors.orange,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SettingElementUnit.getWidget(
                StringManager.monthlySaving,
                _monthlySaving,
                _setMonthlySaving,
                StringManager.monthlySavingUnit,
              ),
              SettingElementUnit.getWidget(
                StringManager.annualInterestRate,
                _annualInterestRate,
                _setAnnualInterestRate,
                StringManager.rate,
              ),
              SettingElementUnit.getWidget(StringManager.savingPeriod,
                  _savingPeriod, _setSavingPeriod, StringManager.year),
            ],
          ),
        ),
      ],
    );
  }
}
