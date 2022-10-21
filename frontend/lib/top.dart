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
  List ingredientsStackList = [];

  void fetchIngredientsStack() async {
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
          ingredientsStackList = data["records"];
        });
        print(ingredientsStackList);
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
            fetchIngredientsStack();
          },
          child: Text('api通信')),
      OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => App(
                      ingredientsStackList: ingredientsStackList,
                      fetchIngredientsStack: fetchIngredientsStack)),
            );
          },
          child: Text('スタート')),
      /* SizedBox(
          height: 50,
          width: 50,
          child: Image.network(
              "https://dl.airtable.com/.attachments/44e5c2a7fee1efd608d609e0d4373534/bdd0d7c8/food_yakisoba.png")) */
      /* CachedNetworkImage(
          imageUrl:
              "https://dl.airtable.com/.attachments/44e5c2a7fee1efd608d609e0d4373534/bdd0d7c8/food_yakisoba.png"), */
    ])));
  }
}
