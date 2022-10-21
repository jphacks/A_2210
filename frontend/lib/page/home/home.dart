import 'package:flutter/material.dart';
import 'package:frontend/common/AddButton.dart';
import 'package:frontend/main.dart';
import '/common/AddButton.dart';
import '/page/home/manual_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/page/home/home_detailFood.dart';
import 'package:frontend/common/AddButton.dart';

const int thretholdAttention = 4; // 「注意」表示日数
const int thretholdHazard = 2; // 「警告」表示日数
Widget HomeContent(
    BuildContext context,
    List ingredientsStockList,
    Function fetchIngredientsStack,
    List ingredientsList,
    Function fetchIngredients) {
  //仮のテスト用変数
  bool onpressed = true; //ボタンのデザイン変化
  int daysRemain = 1; //賞味期限

  List<Color> colorsForAttention = attensionBgColor(daysRemain);
  return Scaffold(
    floatingActionButton: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {}, //カメラスキャンに遷移
          child: const Icon(CupertinoIcons.barcode),
          heroTag: "hero1",
        ),
        AddButton(() {
          fetchIngredients();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ManualRegister(ingredientsList: ingredientsList)),
          );
        }, "hero2")
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
          /* if (ingredientsStockList.length == 0)
            //商品が未登録の場合
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('まずは登録してみよう！！'),
              ],
            ),
          if (ingredientsStockList.length >= 1) */
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
                            '{${ingredientsStockList[index]["fields"]["name"]}'),
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
                            leading: ingredientsStockList[index]["fields"]
                                        ["image"] !=
                                    null
                                ? SizedBox(
                                    height: 110,
                                    child: Image.network(
                                        "${ingredientsStockList[index]["fields"]["image"][0]["url"]}"))
                                : Text(
                                    "${ingredientsStockList[index]["fields"]["image"].toString()}"),
                            title: Column(
                              children: [
                                Text(
                                  '${ingredientsStockList[index]["fields"]["name"]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    '${ingredientsStockList[index]["fields"]["memo"]}'),
                              ],
                            ),
                            trailing: Text('調理可'),
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
}
