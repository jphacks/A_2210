import 'package:flutter/material.dart';

import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

/// -------------------sagara-------------------
/// ----------------------
/// デバッグ用変数 (後で要連携)
/// 調理可能かどうか (可能 -> true, 不可能 -> false)
bool canCook = true;

/// 残り日数
int daysRemain = 2;

/// 食材リスト
List<String> foodList = [
  "にんじん",
  "じゃがいも",
  "トマト",
  "ピーマン",
  "パプリカ",
  "てんさい",
  "ビート",
  "ニンニク",
  "ぶどう",
  "サンマ"
];

/// 数量
int quantity = 5;

/// コメント
String comment = "おいしいおいしいおいしいおいしいおいしいおいしいおいしいおいしい";

///----------------------

/// 「注意」表示日数
const int thretholdAttention = 4;

/// 「警告」表示日数
const int thretholdHazard = 2;

// ignore: non_constant_identifier_names
/// 引数：画面のサイズ
Widget detailFood(BuildContext context, Size screenSize) {
  /// 食品画像表示部の横幅と縦幅
  double widthOfPictureArea = screenSize.width * 0.8;
  double heightOfPictureArea = screenSize.height * 0.17;

  /// ボタンなどの丸み(通常)
  const double borderRadiusNormal = 4;

  /// ボタンの色(通常)
  const Color buttonColorNormal = Color.fromARGB(255, 98, 0, 238);

  /// ボタンの色(警告)
  const Color buttonColorHazard = Color.fromARGB(255, 206, 70, 95);

  /// topのmargin
  const double topMarginNormal = 15;
  const double topMarginLong = 25;
  const double topMarginShort = 4;
  const double topMarginVeryShort = 2;

  /// bottomのmargin
  const double bottomMarginNormal = 8;

  /// インジケータ表示部の文字色
  Color colorsForTextAttension = attensionTextColor(daysRemain);

  /// インジケータ表示部の背景色
  List<Color> colorsForBgAttension = <Color>[];
  colorsForBgAttension = attensionBgColor(daysRemain);

  /* --------------- */
  return Scaffold(
      body: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      /// 「戻る」ボタンの表示
      TextButton(
        style: TextButton.styleFrom(backgroundColor: buttonColorNormal),
        onPressed: () {}, // Home画面に戻る
        child: const Text("戻る",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),

      /// 「調理可(or不可)」ラベル・残り日数インジケータ
      Center(
          child: Container(
              margin: const EdgeInsets.only(top: topMarginShort),
              child: SizedBox(
                  width: widthOfPictureArea,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /// 「調理可」または「調理不可」ラベルの表示
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius:
                                  BorderRadius.circular(borderRadiusNormal),
                            ),
                            child: Center(
                                child: Text(isCookText(canCook),
                                    textAlign: TextAlign.center))),

                        /// 残り日数インジケータの表示
                        Container(
                            decoration: BoxDecoration(
                              color: colorsForBgAttension[0],
                              border:
                                  Border.all(color: colorsForBgAttension[1]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(attentionText(daysRemain),
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(color: colorsForTextAttension)),
                            ))),
                      ])))),

      /// 食品画像等の表示 (要差し替え)
      Center(
          child: Container(
              margin: const EdgeInsets.only(top: topMarginShort),
              color: Colors.blueGrey,
              width: widthOfPictureArea,
              height: heightOfPictureArea,
              child: const Text("ここに画像などを表示", textAlign: TextAlign.center))),

      /// 残り日数表示部
      Center(
          child: Card(
        margin: const EdgeInsets.only(top: topMarginNormal),
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            color: colorsForBgAttension[0],
            border: Border.all(color: colorsForBgAttension[1]),
            borderRadius: BorderRadius.circular(borderRadiusNormal),
          ),
          width: widthOfPictureArea,
          height: heightOfPictureArea * (1.5 / 3),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("残り日数",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorsForTextAttension)),
                Text("$daysRemain日",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorsForTextAttension,
                        fontWeight: FontWeight.bold)),
              ]),
        ),
      )),

      /// 「食材」表示部
      Center(
          child: GestureDetector(
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (_) {
              return dialogDetail(
                  context, "食材", convertFoodListToString(foodList));
            },
          );
        },
        child: EachInfomation(
          label: "食材",
          content: convertFoodListToString(foodList),
          widthOfPictureArea: widthOfPictureArea,
          paddingLeft: 0,
          topMarginNormal: topMarginNormal,
          topMarginVeryShort: topMarginVeryShort,
        ),
      )),

      /// 「数量」表示部
      Center(
          child: GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (_) {
                    return dialogDetail(context, "数量", quantity.toString());
                  },
                );
              },
              child: EachInfomation(
                label: "数量",
                content: quantity.toString(),
                widthOfPictureArea: widthOfPictureArea,
                paddingLeft: 2,
                topMarginNormal: topMarginNormal,
                topMarginVeryShort: topMarginVeryShort,
              ))),

      /// 「コメント」表示部
      Center(
          child: GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (_) {
                    return dialogDetail(context, "コメント", comment);
                  },
                );
              },
              child: EachInfomation(
                label: "コメント",
                content: comment,
                widthOfPictureArea: widthOfPictureArea,
                paddingLeft: 0,
                topMarginNormal: topMarginNormal,
                topMarginVeryShort: topMarginVeryShort,
              ))),

      /// 「編集」および「削除」ボタン
      Center(
        child: Container(
            margin: const EdgeInsets.only(
                top: topMarginLong, bottom: bottomMarginNormal),
            width: widthOfPictureArea * (2 / 3),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// 「編集」ボタンの表示
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: buttonColorNormal,
                        fixedSize: Size(widthOfPictureArea * (1 / 4),
                            heightOfPictureArea * (1 / 3))),
                    onPressed: () {}, // 編集画面に行く
                    child: const Text("編集",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),

                  /// 「削除」ボタンの表示
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: buttonColorHazard,
                        fixedSize: Size(widthOfPictureArea * (1 / 4),
                            heightOfPictureArea * (1 / 3))),
                    onPressed: () {}, // 削除画面に行く
                    child: const Text("削除",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                ])),
      )
    ],
  ));
}

/// ----------↓ functions ↓----------
///
/// 「調理可」「調理不可」のテキストを返す
String isCookText(bool canCook) {
  if (canCook) {
    return "調理可";
  } else {
    return "調理不可";
  }
}

/// 残り日数インジケータ表示部分のテキストを返す
String attentionText(int daysRemain) {
  if (daysRemain <= thretholdHazard) {
    return "対応が必要";
  } else if (daysRemain < thretholdAttention) {
    return "まもなく切れそう";
  } else {
    return "問題なし";
  }
}

/// 残り日数インジケータ表示部分の背景色を返す
List<Color> attensionBgColor(int daysRemain) {
  List<Color> result = <Color>[];

  /// 枠線の色
  const Color borderColor = Colors.blueGrey;

  /// 通常
  const Color colorNormal = Colors.white;

  /// 注意
  const Color colorAttention = Color.fromARGB(255, 235, 237, 115);

  /// 警告
  const Color colorHazard = Color.fromARGB(255, 206, 70, 95);

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

  /// result[0]: 背景色    result[1]: 枠線の色
  return result;
}

/// 残り日数インジケータ表示部分の文字色を返す
Color attensionTextColor(int daysRemain) {
  if (daysRemain <= thretholdHazard) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

/// 食材リストをテキストに加工 (実験)
String convertFoodListToString(List<String> foodList) {
  return foodList.join("、");
}

/// 各情報(食材、数量、コメント)の詳細確認ダイアログ
Widget dialogDetail(BuildContext context, String title, String description) {
  return AlertDialog(
    title: Text(title),
    content: Text(description),
  );
}

/// ---
/// 各情報(食材、数量、コメント)を表示するためのクラス
class EachInfomation extends StatelessWidget {
  final String label;
  final String content;
  final double widthOfPictureArea;
  final double paddingLeft;
  final double topMarginNormal;
  final double topMarginVeryShort;

  const EachInfomation(
      {super.key,
      required this.label,
      required this.content,
      required this.widthOfPictureArea,
      required this.paddingLeft,
      required this.topMarginNormal,
      required this.topMarginVeryShort});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: EdgeInsets.only(top: topMarginNormal),
        child: SizedBox(
          width: widthOfPictureArea,
          child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.blueGrey),
              )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(label,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    Padding(
                      padding: EdgeInsets.only(left: paddingLeft),
                      child: Container(
                          margin: EdgeInsets.only(top: topMarginVeryShort),
                          child: Text(content,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black))),
                    )
                  ])),
        ));
  }
}
