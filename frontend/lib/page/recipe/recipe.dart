import 'package:flutter/material.dart';

Widget RecipeContent(String content) {
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
                    onPressed: () {/*ボタンがタップされた時の処理 */},
                  ),
                  /* 条件の追加の横に追加するボタン */
                  OutlinedButton(
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

            /* タグのように条件の追加を押した後に、選択した条件が黄色の枠に表示されるようにしたい。 */

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
                title: Text('生姜焼き'),
                subtitle: Text("残り賞味期限まで3日"),
                trailing: Column(
                  children: [
                    /*cachedのアイコン表示 */
                    Icon(Icons.cached, size: 15),
                    ElevatedButton(
                      child: Text("作り置き"),
                      onPressed: () {/*ボタンがタップされた時の処理 */},
                    ),
                  ],
                ),
              ),
            ),
            /* 豚肉の炒めの欄の表示 */
            Card(
              child: ListTile(
                title: Text('豚肉の炒め'),
                subtitle: Text("残り賞味期限まで5日"),
                trailing: Column(
                  children: [
                    Icon(Icons.cached, size: 15),
                    ElevatedButton(
                      child: Text("作り置き"),
                      onPressed: () {/*ボタンがタップされた時の処理 */},
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
