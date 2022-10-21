import 'package:flutter/material.dart';

<<<<<<< HEAD
class AddConditions extends StatefulWidget {
  const AddConditions({super.key});

  @override
  State<AddConditions> createState() => _AddConditions();
}

class _AddConditions extends State<AddConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("条件の追加"),
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              child: Text(
                '取り消す',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {},
=======

Widget AddConditions(String content) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          child: Text(
            '取り消す',
            style: TextStyle(
              color: Colors.white,
>>>>>>> haratomo/20221021-1
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('アレルギー',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('カニ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('たまご',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('小麦',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          Spacer(flex: 1),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('時間',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('朝食',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('昼食',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('夜食',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('間食',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          Spacer(flex: 1),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('分野',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('主菜',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('副菜',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  child: Text('汁物',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          Spacer(flex: 2),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              child: Text(
                '条件の追加',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
<<<<<<< HEAD
        ]));
  }
}
=======
        ),
      ),
      Row(
        children: [
          ConditionContainer('カニ'),
          SizedBox(width: 20.0),
          ConditionContainer('たまご'),
          SizedBox(width: 20.0),
          ConditionContainer('小麦'),
        ],
      ),
      Spacer(flex: 1),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          '時間',
          style: TextStyle(
            fontSize: 20,
          )
        ),
      ),
      Row(
        children: [
          ConditionContainer('朝食'),
          SizedBox(width: 20.0),
          ConditionContainer('昼食'),
          SizedBox(width: 20.0),
          ConditionContainer('夜食'),
          SizedBox(width: 20.0),
          ConditionContainer('間食'),
        ],
      ),
      Spacer(flex: 1),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          '分野',
          style: TextStyle(
            fontSize: 20,
          )
        ),
      ),
      Row(
        children: [
          ConditionContainer('主菜'),
          SizedBox(width:20.0),
          ConditionContainer('副菜'),
          SizedBox(width: 20.0),
          ConditionContainer('汁物'),
        ],
      ),
      Spacer(flex: 2),
      Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          child: Text(
            '条件の追加',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: () {},
        ),
      )
    ]
  );
}

Widget ConditionContainer (String condition) {
  return Container(
    width: 100,
    height: 100,
    child: ElevatedButton(
      child: Text(
        condition,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        )
      ),
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
    ),
  );
}
>>>>>>> haratomo/20221021-1
