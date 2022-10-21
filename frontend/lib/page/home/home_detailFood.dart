import 'package:flutter/material.dart';

import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import 'package:flutter/cupertino.dart';

class HomeDetailFood extends StatefulWidget {
  const HomeDetailFood({super.key});

  @override
  State<HomeDetailFood> createState() => _HomeDetailFood();
}

/// -------------------sagara-------------------
/// ----------------------
/// デバッグ用変数 (後で要連携)
/// 調理可能かどうか (可能 -> true, 不可能 -> false)
bool canCook = true;

/// 残り日数
int daysRemain = 2;

///----------------------

/// 「注意」表示日数
final int thretholdAttention = 4;

/// 「警告」表示日数
final int thretholdHazard = 2;

class _HomeDetailFood extends State<HomeDetailFood> {
// ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    /// 食品画像表示部の横幅と縦幅
    const double widthOfPictureArea = 900;
    const double heightOfPictureArea = 100;

    /// ボタンの色(紫)
    const Color buttonColor = Color.fromARGB(255, 98, 0, 238);

    /// インジケータ表示部の文字色
    Color colorsForTextAttension = attensionTextColor(daysRemain);

    /// インジケータ表示部の背景色
    List<Color> colorsForBgAttension = <Color>[];
    colorsForBgAttension = attensionBgColor(daysRemain);

    /* --------------- */
    return Scaffold(
      appBar: AppBar(title: Text("食材の詳細画面")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// 「調理可(or不可)」ラベル・残り日数インジケータ
          Center(
              child: SizedBox(
                  width: widthOfPictureArea,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        /// 「調理可」または「調理不可」ラベルの表示
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(4),
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
                                child: Text(attentionText(daysRemain),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: colorsForTextAttension)))),
                      ]))),

          /// 食品画像等の表示 (要差し替え)
          Center(
              child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  color: Colors.blueGrey,
                  width: widthOfPictureArea,
                  height: heightOfPictureArea,
                  child: Text("ここに画像などを表示(たかみなさんのコンポーネントを使う予定)",
                      textAlign: TextAlign.center))),
        ],
      ),
    );
  }
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
