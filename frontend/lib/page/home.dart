import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

Widget HomeContent(
  String text,
) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*カテゴリボタン */
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                //調理不可ボタン
                onPressed: () {},
                child: Text(
                  "調理不可",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              SizedBox(
                //ボタンの間隔
                width: 10,
              ),
              ElevatedButton(
                //調理可ボタン
                onPressed: () {},
                child: Text(
                  "調理可",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          for (var i = 0; i < 13; i++)
            Card(
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
          // Container(
          //   width: 400,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          // ),
        ],
      ),
    ),
  );
  /* DropdownButton(items: [DropdownMenuItem(child: "child" ,value: "hoge")], onChanged: onChanged)); */
}
