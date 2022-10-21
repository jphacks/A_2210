import 'package:flutter/material.dart';

Widget ToggleButton(List<bool> _toggleList, Function toggleButtonOnPressed) {
  return ToggleButtons(
    onPressed: (int? index) {
      toggleButtonOnPressed(index);
    },
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    selectedBorderColor: Colors.indigo,
    selectedColor: Colors.indigo,
    fillColor: Colors.indigo,
    color: Colors.white,
    constraints: const BoxConstraints(
      minHeight: 40.0,
      minWidth: 80.0,
    ),
    children: [
      Text(
        "調理可",
        style: TextStyle(color: _toggleList[0] ? Colors.white : Colors.indigo),
      ),
      Text(
        "調理不可",
        style: TextStyle(color: _toggleList[1] ? Colors.white : Colors.indigo),
      ),
    ],
    isSelected: _toggleList,
  );
}
