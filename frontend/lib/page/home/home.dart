import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

/*Widget HomeContent(
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
}*/

/// -------------------sagara-------------------
const int thretholdAttention = 4; // 「注意」表示日数
const int thretholdHazard = 2; // 「警告」表示日数

// ignore: non_constant_identifier_names
Widget DetaileFood() {
  // テスト用変数
  bool canCook = true;
  int daysRemain = 1;

  List<Color> colorsForAttension = <Color>[];
  colorsForAttension = attensionColor(daysRemain);

  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: () {}, // Home画面に戻る
          child: const Text('戻る'),
        ),
        Row(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: isCookText(canCook))),
          Container(
              decoration: BoxDecoration(
                color: colorsForAttension[0],
                border: Border.all(color: colorsForAttension[1]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: attentionText(daysRemain))),
        ]),
        Container(
          color: Colors.blueGrey,
          width: 900,
          height: 100,
        ),
      ],
    ),
  );
}

/// 「調理可」「調理不可」のテキスト
Text isCookText(bool canCook) {
  if (canCook) {
    return const Text("調理可");
  } else {
    return const Text("調理不可");
  }
}

/// 残り日数インジケータ表示部分のテキスト
Text attentionText(int daysRemain) {
  if (daysRemain <= thretholdHazard) {
    return const Text("まもなく切れます");
  } else if (daysRemain < thretholdAttention) {
    return const Text("期限が近づいています");
  } else {
    return const Text("問題なし");
  }
}

/// 残り日数インジケータ表示部分の色
List<Color> attensionColor(int daysRemain) {
  List<Color> result = <Color>[];

  const Color borderColor = Colors.blueGrey; // 枠線の色

  const Color colorNormal = Colors.white; // 通常
  const Color colorAttention = Colors.yellow; // 注意
  const Color colorHazard = Colors.red; // 警告

  if (daysRemain <= thretholdHazard) {
    result.add(colorHazard);
    result.add(colorHazard);
  } else if (daysRemain <= thretholdAttention) {
    result.add(colorAttention);
    result.add(colorAttention);
  } else {
    result.add(colorNormal);
    result.add(borderColor);
  }

  // result[0]: 背景色    result[1]: 枠線の色
  return result;
}
