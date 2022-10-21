import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddButton(Function onPressed, String heroTag) {
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => {
      if (onPressed != null) {onPressed()}
    },
    heroTag: heroTag,
  );
}
