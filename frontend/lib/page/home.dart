import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

Widget HomeContent(
  String text,
) {
  List<String> imageslist = [
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
  List<String> storelist = [
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
    floatingActionButton: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.barcode),
        ),
        SizedBox(
          width: 220,
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
              itemCount: storelist.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('「${storelist[index]}」を削除しました'),
                        action: SnackBarAction(
                          label: '元に戻す',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('${storelist[index]}\n'),
                      trailing: Text('${imageslist[index]}\n'),
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
