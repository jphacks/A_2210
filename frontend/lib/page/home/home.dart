import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import '/common/AddButton.dart';
import '/page/home/manual_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/page/home/home_detailFood.dart';
import 'package:frontend/common/AddButton.dart';
import 'home_detailFood.dart';
import '/common/ToggleButtons.dart';

const int thretholdAttention = 4; // 「注意」表示日数
const int thretholdHazard = 2; // 「警告」表示日数

Widget HomeContent(
    BuildContext context,
    List ingredientsStockList,
    Function fetchIngredientsStock,
    List ingredientsList,
    Function fetchIngredients,
    Function toggleButtonOnPressed,
    List<bool> _toggleList) {
  //仮のテスト用変数

  bool vertical = false;
  bool onpressedCancook = true; //調理可のボタンのデザイン変化
  bool onpressedCantcook = true; //調理不可のボタンのデザイン変化
  int daysRemain = 1; //賞味期限

  List<Color> colorsForAttention = attensionBgColor(daysRemain);
  return Scaffold(
    floatingActionButton: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //TODO: 余裕があったらカメラ入力追加
        /* FloatingActionButton(
          onPressed: () {}, //カメラスキャンに遷移
          child: const Icon(CupertinoIcons.barcode),
          heroTag: "hero1",
        ), */
        AddButton(() {
          fetchIngredients();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManualRegister(
                    ingredientsList: ingredientsList,
                    fetchIngredients: fetchIngredients,
                    ingredientsStockList: ingredientsStockList,
                    fetchIngredientsStock: fetchIngredientsStock),
              ));
        }, "hero2")
      ],
    ),
    body: Scrollbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //TODO：両方押さない機能
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ToggleButton(_toggleList, toggleButtonOnPressed),
              ]),
            ],
          ),
          if (ingredientsStockList.length == 0)
            //商品が未登録の場合
            Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Text(
                  'まずは登録してみよう！！',
                  /*まずは登録してみようの大きさの変更 */
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            ]),
          if (ingredientsStockList.length >= 1)
            //商品が登録している場合
            Flexible(
              child: ListView.builder(
                itemCount: ingredientsStockList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    //カードをスライドして削除出来るようにしている
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          //削除したときに「元に戻す」スナックバー
                          content: Text(
                              '${ingredientsStockList[index]["fields"]["name"]}を削除しました'),
                          action: SnackBarAction(
                            label: '元に戻す',
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                        height: 70, //カードの大きさを変えた。
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeDetailFood()),
                            );
                          },
                          child: Card(
                            color: colorsForAttention[daysRemain], //賞味期限による色の変化
                            child: Column(
                              children: [
                                ListTile(
                                  leading: ingredientsStockList[index]["fields"]
                                              ["image"] !=
                                          null
                                      ? SizedBox(
                                          height: 110,
                                          child: Image.network(
                                              "${ingredientsStockList[index]["fields"]["image"][0]["url"]}"))
                                      : Text("未設定"),
                                  title: Column(
                                    children: [
                                      Text(
                                        '${ingredientsStockList[index]["fields"]["name"]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  trailing: Text('調理可'),
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    ),
  );
}
