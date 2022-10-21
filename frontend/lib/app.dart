import 'package:flutter/material.dart';
import 'package:frontend/page/home/home_detailFood.dart';
import 'page/home/home.dart';

import 'page/meal_prep_list/meal_prep_list.dart';

import 'page/recipe/recipe.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> titleList = ["ホーム", "レシピ", "作り置きリスト"];
  List iconList = [Icons.home, Icons.search, Icons.school];
  // TODO : dataListの型定義
  List dataList = [];

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
        });
      } catch (e) {
        throw e;
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleList[_selectedIndex]),
      ),
      body: Center(
          // 引数が多くなってしまうため、Widget化せずに直接書く
          // switch文が使えないから三項演算子で書いてるけど、もっといい方法ある？
          child: _selectedIndex == 0
              ? HomeContent(context, dataList, fetchIngredients)
              : _selectedIndex == 1
                  ? RecipeContent('レシピですん')
                  : _selectedIndex == 2
                      ? MealContent('レシピで寸')
                      //TODO: snackbarに変更
                      : Text('this is error')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          for (var i = 0; i < titleList.length; i++)
            BottomNavigationBarItem(
              icon: Icon(iconList[i]),
              label: titleList[i],
            ),
        ],
        enableFeedback: true,
        iconSize: 25,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedFontSize: 15,
      ),
    );
  }
}
