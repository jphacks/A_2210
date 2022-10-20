import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

import 'home.dart';

Widget ExpiryDateList() {
  return Scaffold(
    body: Container(
      child: Column(
        children: [
          ExpiryDate(),
          ExpiryDate(),
        ],
      ),
    ),
  );
}

Widget ExpiryDate() {
  return TextField();
}
