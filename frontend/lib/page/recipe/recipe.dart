import 'package:flutter/material.dart';
import 'add_conditions.dart';
import '../meal_prep_list/meal_prep_list.dart';

Widget RecipeContent(BuildContext context) {
  /* cardのtitleに入れられるリスト。
    料理名が格納されている。
   */
  List<String> recipe_name = ["生姜焼き", "豚肉の炒め"];
  /* cardのTextに入れられるリスト。
    賞味期限までの日数が格納されている。 */
  List<int> term = [3, 5];
  return Column(
    children: [
      Expanded(
        child: Column(
          children: [
            Container(
              /* 条件の追加のボタン */
              alignment: Alignment.centerLeft,
              height: 30,
              color: Colors.yellow,
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text("条件の追加"),
                    onPressed: () {
                      /*ボタンがタップされた時の処理 */
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddConditions()),
                      );
                    },
                  ),
                  /* 条件の追加の横に追加するボタン
                  押されると、無力化されて、検索の条件から外される。（まだ実装されていない）
                  */
                  OutlinedButton(
                    /* onPressed: 条件 ? 条件がTrueの時 null : 条件がfalseの時(){ボタンを押したら行われる処理}

                    */
                    onPressed: () {},
                    child: Text(
                      "夜食",
                      style: TextStyle(color: Colors.black),
                    ),
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "主菜",
                      style: TextStyle(color: Colors.black),
                    ),
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),

            /* 検索欄 */
            const TextField(
              decoration: InputDecoration(
                /*検索枠前のアイコンの指定*/
                icon: Icon(
                  Icons.search,
                ),
                /*検索中の欄とその下に表示されるテキスト */
                hintText: '検索',
                helperText: '',
                counterText: '',
                border: OutlineInputBorder(),
              ),
            ),

            /* 生姜焼きの欄の表示 */
            Card(
              child: ListTile(
                title: Text(recipe_name[0]),
                subtitle: Text("残り賞味期限まで${term[0]}日"),
                trailing: Column(
                  children: [
                    /*cachedのアイコン表示 */
                    Icon(Icons.cached, size: 15),
                    ElevatedButton(
                      child: Text("作り置き"),
                      onPressed: () {
                        /*ボタンがタップされた時の処理 */
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealListEdit()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            /* 豚肉の炒めの欄の表示 */
            Card(
              child: ListTile(
                title: Text(recipe_name[1]),
                subtitle: Text("残り賞味期限まで${term[1]}日"),
                trailing: Column(
                  children: [
                    Icon(Icons.cached, size: 15),
                    ElevatedButton(
                      child: Text("作り置き"),
                      onPressed: () {
                        /*ボタンがタップされた時の処理
                          meal_prep_list.dartの class MealListEditに飛んでいる。

                          */
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealListEdit()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
