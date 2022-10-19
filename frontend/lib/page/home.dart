import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';

Widget HomeContent(
  String text,
) {
  List picture;
  return Scaffold(
    floatingActionButton: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        )
      ],
    ),
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
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Ink.image(
                      image: const AssetImage('{picture}'),
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text('ora'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                      child: Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
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
