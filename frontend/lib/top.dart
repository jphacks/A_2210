import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/app.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPage();
}

class _TopPage extends State<TopPage> {
  // TODO : dataListの型定義
  List dataList = [];
  var done = false;

  void fetchIngredients() async {
    final dio = Dio();
    final id = dotenv.get('APPLICATION_ID');
    final key = dotenv.get('API_KEY');
    final url = 'https://api.airtable.com/v0/$id/ingredients';
    final response = await dio.get(url,
        options: Options(
          headers: {"Authorization": "Bearer $key"},
        ));

    if (response.statusCode == 200) {
      try {
        final data = response.data;
        setState(() {
          dataList = data["records"];
          done = true;
        });
        print('通信制高');
      } catch (e) {
        throw e;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(height: 150),
      Text(
        "kondate\nmanager",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
      ),
      OutlinedButton(
          onPressed: () {
            if (done) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => App(
                        dataList: dataList,
                        fetchIngredients: fetchIngredients)),
              );
            }
            fetchIngredients();
          },
          child: Text('スタート'))
    ])));
  }
}
