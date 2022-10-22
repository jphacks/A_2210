import 'package:flutter/material.dart';
import 'package:frontend/app.dart';

Widget HomeContent(
  String text,
  List dataList,
) {
  List ingredientNameList = ["にんじん"];
  String? isSelectedItem = "にんじん";

  for (var i = 0; i < dataList.length; i++)
    ingredientNameList.add(dataList[i]["fields"]["Name"].toString());
  return (Column(children: [
    /* DropButton(items:[] */
    DropdownButton(items: [
      for (var j = 0; j < ingredientNameList.length; j++)
        DropdownMenuItem(
            child: Text(ingredientNameList[j]), value: ingredientNameList[j])
    ], onChanged: (value) => {isSelectedItem = "じゃがいも"}, value: isSelectedItem),
  ]));
  /* DropdownButton(items: [DropdownMenuItem(child: "child" ,value: "hoge")], onChanged: onChanged)); */
}
