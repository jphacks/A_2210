import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import '/common/ToggleButtons.dart';
import 'package:frontend/app.dart';

class ManualRegister extends StatefulWidget {
  final List<String> ingredientsList;
  final Function fetchIngredients;
  const ManualRegister({
    super.key,
    required this.fetchIngredients,
    required this.ingredientsList,
  });

  @override
  State<ManualRegister> createState() => _ManualRegister();
}

class _ManualRegister extends State<ManualRegister> {
  /*  List<String> ingredientNameList = ["未選択"]; */
  String? _isSelectedItem;
  double _volume = 0;
  TextEditingController _date = TextEditingController(text: "");
  String? _formatedDate;
  String? _memo = "";
  var _toggleList = <bool>[false, false];
  bool done = false;
  List ingredientsStockList = [];

  void postIngredient() async {
    final dio = Dio();
    final id = dotenv.get('APPLICATION_ID');
    final key = dotenv.get('API_KEY');
    final data = {
      "records": [
        {
          "fields": {
            "name": _isSelectedItem,
            "volume": _volume.toString(),
            "limit": _formatedDate,
            "Select": _toggleList[0] ? '調理可' : '調理不可',
            "memo": _memo,
          }
        }
      ]
    };
    final url = 'https://api.airtable.com/v0/${id}/ingredients-stock';
    final response = await dio.post(url,
        data: data,
        options: Options(headers: {
          "Authorization": " Bearer $key",
          "Content-Type": "application/json",
        }));

    if (response.statusCode == 200) {
      try {
        final data = response.data;
      } catch (e) {
        throw e;
      }
    }
  }

  void fetchIngredientsStock() async {
    final dio = Dio();
    final id = dotenv.get('APPLICATION_ID');
    final key = dotenv.get('API_KEY');
    final url = 'https://api.airtable.com/v0/$id/ingredients-stock';
    final response = await dio.get(url,
        options: Options(
          headers: {"Authorization": "Bearer $key"},
        ));

    if (response.statusCode == 200) {
      try {
        final data = response.data;
        setState(() {
          ingredientsStockList = data["records"];
          done = true;
        });
        print(ingredientsStockList);
      } catch (e) {
        throw e;
      }
    }
  }

  void toggleButtonOnPressed(int index) {
    setState(() {
      _toggleList[index] = !_toggleList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("食材追加"),
        ),
        body: Center(
            child: Column(children: [
          ToggleButton(_toggleList, toggleButtonOnPressed),
          SizedBox(height: 30),
          DropdownButton(
            items: [
              for (var j = 0; j < widget.ingredientsList.length; j++)
                DropdownMenuItem(
                  child: Text(widget.ingredientsList[j]),
                  value: widget.ingredientsList[j],
                )
            ],
            onChanged: (value) {
              setState(() {
                _isSelectedItem = value;
              });
            },
            value: _isSelectedItem,
          ),
          SizedBox(height: 30),
          Row(
            children: [
              if (_volume > 0)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _volume = _volume - 0.5;
                      });
                    },
                    child: Icon(Icons.remove)),
              Text(_volume == 0.0 ? '0' : _volume.toString()),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _volume = _volume + 0.5;
                    });
                  },
                  child: Icon(Icons.add))
            ],
          ),
          TextField(
            controller: _date,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '日付',
              // inputの端にカレンダーアイコンをつける
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  // textFieldがの値からデフォルトの日付を取得する
                  DateTime initDate = DateTime.now();
                  try {
                    initDate = DateFormat('yyyy/MM/dd').parse(_date.text);
                  } catch (_) {}

                  // DatePickerを表示する
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: initDate,
                    firstDate: DateTime(2016),
                    lastDate: DateTime.now().add(
                      Duration(days: 360),
                    ),
                  );

                  // DatePickerで取得した日付を文字列に変換
                  String? formatedDate;
                  try {
                    formatedDate = DateFormat('yyyy/MM/dd').format(picked!);
                    setState(() {
                      _formatedDate = formatedDate;
                    });
                  } catch (_) {}
                  if (formatedDate != null) {
                    _date.text = formatedDate;
                  }
                },
              ),
            ),
          ),
          TextField(
            maxLength: 50,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: "memo",
            ),
            onChanged: (text) {
              setState(() {
                _memo = text;
              });
            },
          ),
          //TODO: 日付が入力されていない場合のエラー出力
          OutlinedButton(
              onPressed: () {
                fetchIngredientsStock();
                if (done == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => App(
                            ingredientsStockList: ingredientsStockList,
                            fetchIngredientsStock: fetchIngredientsStock)),
                  );
                  postIngredient();
                  done = false;
                }
              },
              child: Text('確定')),
          Text(widget.ingredientsList.toString())
        ])));
  }
}
