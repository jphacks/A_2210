import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/page/home/home_detailFood.dart';

const int thretholdAttention = 4; // 「注意」表示日数
const int thretholdHazard = 2; // 「警告」表示日数
Widget HomeContent(
  String text,
) {
  //仮のテスト用変数
  bool onpressed = true; //ボタンのデザイン変化
  int daysRemain = 1; //賞味期限
  List<String> ExpiryDateList = [
    '2022/02/02',
  ];
  List<String> ImagesList = [
    '写真',
  ];
  List<String> StoreList = [];
  List<Color> colorsForAttention = attensionColor(daysRemain);
  return Scaffold(
    floatingActionButton: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {}, //カメラスキャンに遷移
          child: const Icon(CupertinoIcons.barcode),
        ),
        FloatingActionButton(
          onPressed: () {}, //カメラスキャンに遷移
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
          StoreList.isEmpty
              //商品が未登録の場合
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('まずは登録してみよう！！'),
                  ],
                )
              //商品が登録している場合
              : Flexible(
                  child: ListView.builder(
                    itemCount: StoreList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        //カードをスライドして削除出来るようにしている
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              //削除したときに「元に戻す」スナックバー
                              content: Text('「${StoreList[index]}」を削除しました'),
                              action: SnackBarAction(
                                label: '元に戻す',
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 100, //カードの大きさを変えた。
                          child: Card(
                            color: colorsForAttention[daysRemain], //賞味期限による色の変化
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    '${ImagesList[index]}', //写真にする予定
                                  ),
                                  trailing: Column(
                                    children: [
                                      Text(
                                        '${StoreList[index]}',
                                        textAlign: TextAlign.center,
                                      ),
                                      Text('${ExpiryDateList[index]}'),
                                      Text(""),
                                    ],
                                  ),
                                ),
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
