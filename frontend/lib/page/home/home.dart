import 'package:flutter/material.dart';

import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

Widget HomeContent(
  String text,
) {
  List<String> ExpiryDateList = [
    '2022/02/02',
    '2021/10/03',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> ImagesList = [
    '写真1',
    '写真2',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> StoreList = [
    'にんじん',
    'ジャガイモ',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  return Scaffold(
    floatingActionButton: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.barcode),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ],
    ),
    body: Scrollbar(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    //調理不可ボタン
                    onPressed: () {},
                    child: Text(
                      "調理不可",
                      style: TextStyle(
                        color: Colors.indigo,
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
                        color: Colors.indigo,
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
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: StoreList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('「${StoreList[index]}」を削除しました'),
                        action: SnackBarAction(
                          label: '元に戻す',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('${ImagesList[index]}\n'),
                      trailing: Column(
                        children: [
                          Text('${StoreList[index]}'),
                          Text('${ExpiryDateList[index]}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );

  /* DropdownButton(items: [DropdownMenuItem(child: "child" ,value: "hoge")], onChanged: onChanged)); */
}
