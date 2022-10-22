import 'package:flutter/material.dart';
import '../../common/AddButton.dart';

List<Color> _colors = [Colors.white, Colors.yellow, Colors.red];

class Meal {
  String name;
  List<String> ingredients;
  int elapsedDay;
  bool eaten;
  Meal(this.name, this.ingredients, this.elapsedDay, this.eaten);

  changeOnState() {
    eaten = !eaten;
  }
}

Widget MealContent(String text, BuildContext context) {
  return MealListPage();
}

class MealListPage extends StatefulWidget {
  const MealListPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MealListPage();
}

class _MealListPage extends State<MealListPage> {
  List<Meal> mealList = [
    Meal('生姜焼き', ['豚肉', '玉ねぎ'], 4, false),
    Meal('豚肉炒め', ['豚肉', 'もやし'], 1, false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddButton(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddMealPage()))
              .then((newMeal) {
            if (newMeal != null&& newMeal.name.length > 0) {
              addNewTask(newMeal);
            }
          });
        }, "hero1"),
        body: Container(
          child: ListView.builder(
              itemCount: mealList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('「${mealList[index].name}」を削除しました'),
                          action: SnackBarAction(
                            label: '元に戻す',
                            onPressed: () {
                              //スワイプした後に元に戻す処理
                            },
                          )),
                    );
                  },
                  child: MealCard(mealList[index]),
                );
              }),
        ));
  }

  addNewTask(Meal newMeal) {
    setState(() => mealList.add(newMeal));
  }

}

class MealCard extends StatelessWidget {
  const MealCard(this._meal, {Key? key}) : super(key: key);
  final Meal _meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title:
                Text('${_meal.name}', style: const TextStyle(fontSize: 24.0)),
          ),
          ListTile(
            title: Text('${_meal.elapsedDay}day'),
            tileColor: _colors[(_meal.elapsedDay > 2 ? 1 : 0) +
                (_meal.elapsedDay > 4 ? 1 : 0)],
          ),
          ListTile(
            title: Text('食材'),
            subtitle: Text(_meal.ingredients.join(' ')),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  //編集ボタンを押すときの処理
                }, 
                child: Text('編集')
              )
          )
        ],
      ),
    );
  }
}

class AddMealPage extends StatelessWidget {
  final List<TextEditingController> _Controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  AddMealPage({Key? key}) : super(key: key);

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
                child: TextFormField(
                    controller: _Controllers[0],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: '料理名',
                    )),
              ),
            ),
            Card(
              child: TextFormField(
                  controller: _Controllers[1],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材1',
                  )),
            ),
            Card(
              child: TextFormField(
                  controller: _Controllers[2],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材2',
                  )),
            ),
            Card(
              child: TextFormField(
                  controller: _Controllers[3],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材3',
                  )),
            ),
            Card(
              child: TextFormField(
                  controller: _Controllers[4],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材4',
                  )),
            ),
            Card(
              child: TextFormField(
                  controller: _Controllers[5],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '食材5',
                  )),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(Meal(
                      _Controllers[0].text,
                      [
                        _Controllers[1].text,
                        _Controllers[2].text,
                        _Controllers[3].text,
                        _Controllers[4].text,
                        _Controllers[5].text
                      ],
                      1,
                      false));
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
