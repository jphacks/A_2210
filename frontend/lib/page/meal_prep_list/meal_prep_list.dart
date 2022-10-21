import 'package:flutter/material.dart';
import '../../common/AddButton.dart';

Widget MealContent(String s) {
  List<String> mealList = ['料理名1', '料理名2'];
  List<List<String>> ingredientLists = [
    ['食材1', '食材2'],
    ['食材3', '食材4']
  ];
  List<int> elapsedDay = [1, 5];
  List<Color> colors = [Colors.white, Colors.yellow, Colors.red];
  return Scaffold(
    floatingActionButton: AddButton(() => {}, "hero1"),
    body: Container(
      child: ListView.builder(
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
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('${mealList[index]}',
                          style: const TextStyle(fontSize: 24.0)),
                    ),
                    ListTile(
                      title: Text('${elapsedDay[index]}day'),
                      tileColor: colors[(elapsedDay[index] > 2 ? 1 : 0) +
                          (elapsedDay[index] > 4 ? 1 : 0)],
                    ),
                    ListTile(
                      title: Text('食材'),
                      subtitle: Text(ingredientLists[index].join(' ')),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child:
                            ElevatedButton(onPressed: () {}, child: Text('編集')))
                  ],
                ),
              ),
            );
          }),
    ),
  );
}

class MealListEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: InputMealIngredient('料理名'),
            ),
            InputMealIngredient('食材1'),
            InputMealIngredient('食材2'),
            InputMealIngredient('食材3'),
            InputMealIngredient('食材4'),
            InputMealIngredient('食材5'),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('確定'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget InputMealIngredient(String label) {
  return Card(
    child: TextField(
        decoration: InputDecoration(
      border: InputBorder.none,
      labelText: label,
    )),
  );
}
