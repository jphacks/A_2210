import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddButton(Function onPressed) {
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => {
      if (onPressed != null) {onPressed()}
    },
  );
}
