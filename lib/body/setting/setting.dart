import 'package:asset_management_simulator/body/setting/setting_element_unit.dart';
import 'package:asset_management_simulator/services/string_manager.dart';
import 'package:flutter/material.dart';

class Setting {
  static List<int> items = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    15,
    20,
    25,
    30,
    50,
    100
  ];

  static Row getWidget(
    String dropdownValue,
    void Function(String) setDropdownValue,
    int monthlySaving,
    void Function(int) setMonthlySaving,
    int annualInterestRate,
    void Function(int) setAnnualInterestRate,
    int savingPeriod,
    void Function(int) setSavingPeriod,
    int targetAmount,
    void Function(int) setTargetAmount,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DropdownButton(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          style: const TextStyle(color: Colors.orange),
          underline: Container(
            height: 2,
            color: Colors.orangeAccent,
          ),
          onChanged: (Object? newValue) {
            setDropdownValue(newValue.toString());
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
              if (dropdownValue != StringManager.dropdownValues[1])
                // 「毎月積立金額」を選択してる場合のみ、非表示、そうでない場合に「毎月の積立金額」蘭を表示
                SettingElementUnit.getWidget(
                  StringManager.monthlySaving,
                  monthlySaving,
                  setMonthlySaving,
                  items,
                  StringManager.monthlySavingUnit,
                ),
              SettingElementUnit.getWidget(
                StringManager.annualInterestRate,
                annualInterestRate,
                setAnnualInterestRate,
                items,
                StringManager.rate,
              ),
              // TODO: *** アップデート ***
              // if (_dropdownValue != StringManager.dropdownValues.last)
              // 「積立期間」を選択してる場合のみ、非表示、そうでない場合に「積立期間」蘭を表示
              SettingElementUnit.getWidget(
                StringManager.savingPeriod,
                savingPeriod,
                setSavingPeriod,
                items,
                StringManager.year,
              ),
              if (dropdownValue != StringManager.dropdownValues.first)
                // 「最終積立金額」を選択してる場合のみ、非表示、そうでない場合に「目標金額」蘭を表示
                SettingElementUnit.getWidget(
                  StringManager.targetAmount,
                  targetAmount,
                  setTargetAmount,
                  items.map((element) => element * 100).toList(),
                  StringManager.monthlySavingUnit,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
