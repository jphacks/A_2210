import 'package:flutter/material.dart';
import '../common/AddButton.dart';

Widget MealContent () {
  List<String> mealList = ['料理名1', '料理名2'];
  return Scaffold(
    floatingActionButton: AddButton(),
    body: Container(
      child: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(), 
            onDismissed: (direction){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('「${mealList[index]}」を削除しました'),
                  action: SnackBarAction(
                    label: '元に戻す',
                    onPressed: () {

                    },
                  )
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text('${mealList[index]}\n1日'),
                subtitle: Text('食材1 食材2'),
              ),
            ),
          );
        }
      ),
    ),
  );
}

Widget MealListEdit () {
  return Scaffold(
    body: Container(
      child: Column(
        children: <Widget>[
          InputMealIngredient('料理名'),
          InputMealIngredient('食材1'),
          InputMealIngredient('食材2'),
          InputMealIngredient('食材3'),
          InputMealIngredient('食材4'),
          InputMealIngredient('食材5'),
        ],
      ),
    ),
  );
}

Widget InputMealIngredient (String hint) {
  return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hint,
    )
  );
}

