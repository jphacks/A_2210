import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

Widget HomeContent(
  String text,
) {
  List picture;
  List<String> storelist = ['にんじん', 'ジャガイモ'];
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
    body: SingleChildScrollView(
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
              ),
            ),
          );
        },
      ),
    ),
  );

  // children: [
  //   /*カテゴリボタン */
  //   Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       ElevatedButton(
  //         //調理不可ボタン
  //         onPressed: () {},
  //         child: Text(
  //           "調理不可",
  //           style: TextStyle(
  //             color: Colors.blue,
  //           ),
  //         ),
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(Colors.white),
  //         ),
  //       ),
  //       SizedBox(
  //         //ボタンの間隔
  //         width: 10,
  //       ),
  //       ElevatedButton(
  //         //調理可ボタン
  //         onPressed: () {},
  //         child: Text(
  //           "調理可",
  //           style: TextStyle(
  //             color: Colors.blue,
  //           ),
  //         ),

  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(Colors.white),
  //         ),
  //       ),
  //       SizedBox(
  //         width: 10,
  //       ),
  //     ],
  //   ),
  //   Card(
  //     clipBehavior: Clip.antiAlias,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //     child: Row(
  //       children: [
  //         Stack(
  //           children: [
  //             Ink.image(
  //               image: const AssetImage('{picture}'),
  //               height: 100,
  //               fit: BoxFit.fill,
  //             ),
  //             Positioned(
  //               bottom: 16,
  //               right: 16,
  //               left: 16,
  //               child: Text('www'),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16).copyWith(bottom: 0),
  //               child: Text(
  //                 '',
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 1,
  //                 style: TextStyle(fontSize: 16),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   ),
  //   // Container(
  //   //   width: 400,
  //   //   height: 100,
  //   //   decoration: BoxDecoration(
  //   //     color: Colors.grey[100],
  //   //     borderRadius: BorderRadius.circular(20),
  //   //   ),
  //   // ),
  // ],

  /* DropdownButton(items: [DropdownMenuItem(child: "child" ,value: "hoge")], onChanged: onChanged)); */
}
