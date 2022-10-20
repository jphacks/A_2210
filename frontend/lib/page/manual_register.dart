import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ManualRegister extends StatefulWidget {
  final List? dataList;
  const ManualRegister({super.key, this.dataList});

  @override
  State<ManualRegister> createState() => _ManualRegister();
}

class _ManualRegister extends State<ManualRegister> {
  List<String> ingredientNameList = ["にんじん", "じゃがいも", "お芋"];
  String? _isSelectedItem = "にんじん";

  void postIngredient() async {
    final dio = Dio();
    final id = dotenv.get('APPLICATION_ID');
    final key = dotenv.get('API_KEY');
    final data = {
      "records": [
        {
          "fields": {
            "name": _isSelectedItem,
            "volume": "2.0",
            "limit": "2022-10-28"
          }
        }
      ]
    };
    final url = 'https://api.airtable.com/v0/${id}/ingredients-stack';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("食材追加"),
        ),
        body: Center(
            child: Column(children: [
          SizedBox(height: 30),
          DropdownButton(
            items: [
              for (var j = 0; j < ingredientNameList.length; j++)
                DropdownMenuItem(
                  child: Text(ingredientNameList[j]),
                  value: ingredientNameList[j],
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
          OutlinedButton(
              onPressed: () => {postIngredient()}, child: Text('確定')),
        ])));
  }
}
