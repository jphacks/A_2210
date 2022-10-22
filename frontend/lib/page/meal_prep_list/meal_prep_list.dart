import 'package:flutter/material.dart';
import '../../common/AddButton.dart';

Widget MealContent(String s, context) {
  List<String> mealList = ['料理名1', '料理名2'];
  List<List<String>> ingredientLists = [
    ['食材1', '食材2', '', '', ''],
    ['食材3', '食材4', '', '', ''],
  ];
  String newMealName = '';
  List<String> newIngredientList = ['', '', '', '', ''];
  List<int> elapsedDay = [1, 5];
  List<Color> colors = [Colors.white, Colors.yellow, Colors.red];
  return Scaffold(
    floatingActionButton: AddButton(
        () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealListEdit(
                            mealName: newMealName,
                            ingredientLIst: newIngredientList,
                          )))
            },
        "hero1"),
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
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MealListEdit(
                                  mealName: mealList[index],
                                  ingredientLIst: ingredientLists[index],
                                ),
                              ));
                            },
                            child: Text('編集'))),
                  ],
                ),
              ),
            );
          }),
    ),
  );
}

class MealListEdit extends StatefulWidget {
  String mealName;
  List<String> ingredientLIst;
  MealListEdit({Key? key, required this.mealName, required this.ingredientLIst})
      : super(key: key);
  @override
  State<MealListEdit> createState() => _MealListEdit();
}

class _MealListEdit extends State<MealListEdit> {
  final mealController = TextEditingController();
  var ingredientControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  late String stateMeal;
  late List<String> stateIngredient;
  @override
  void initState() {
    super.initState();
    stateMeal = widget.mealName;
    stateIngredient = widget.ingredientLIst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('作り置き'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Card(
                child: TextField(
                    controller: mealController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '料理名',
                    )),
              ),
            ),
            Card(
              child: TextField(
                  controller: ingredientControllers[0],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材1',
                  )),
            ),
            Card(
              child: TextField(
                  controller: ingredientControllers[1],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材2',
                  )),
            ),
            Card(
              child: TextField(
                  controller: ingredientControllers[2],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材3',
                  )),
            ),
            Card(
              child: TextField(
                  controller: ingredientControllers[3],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材4',
                  )),
            ),
            Card(
              child: TextField(
                  controller: ingredientControllers[4],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材5',
                  )),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  widget.mealName = mealController.text;
                  for (int i = 0; i < 5; i++) {
                    widget.ingredientLIst[i] = ingredientControllers[i].text;
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('確定'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget InputMealIngredient(String label, String ingredient) {
  final myController = TextEditingController();
  return Card(
    child: TextField(
        controller: myController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
        )),
  );
}
