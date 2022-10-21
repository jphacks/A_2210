import 'package:flutter/material.dart';

Widget RecipeContent(String content) {
  List<String> mealList = ['料理名1', '料理名2'];

  return Column(
    children: [
      Expanded(
        child: Column(
          children: [
            Container(
              /*ボタン */
              alignment: Alignment.centerLeft,
              height: 30,
              color: Colors.yellow,
              child: ElevatedButton(
                child: Text("条件の追加"),
                onPressed: () {/*ボタンがタップされた時の処理 */},
              ),
            ),

            /*リスト？ */
            //error吐いていたため、とりあえずコメントアウト
            /* ListView.builder(
                itemCount: mealList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('「${mealList[index]}」を削除しました'),
                            action: SnackBarAction(
                              label: '元に戻す',
                              onPressed: () {},
                            )),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('${mealList[index]}\n1日'),
                        subtitle: Text('食材1 食材2'),
                      ),
                    ),
                  );
                }), */
          ],
        ),
      ),
    ],
  );
}
