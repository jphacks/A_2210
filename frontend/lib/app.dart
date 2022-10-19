import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/meal_prep_list.dart';
import 'page/recipe.dart';
import 'package:dio/dio.dart';

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

  fetchIngredients() async {
    final dio = Dio();
    const url = "https://api.airtable.com/v0/apphMJn3OcStZkcT9/ingredients";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        final data = response.data;
        return data["fields"];
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
        child: _bodyContents(
          _selectedIndex,
          fetchIngredients,
          dataList,
        ),
      ),
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

Widget _bodyContents(int id, Function fetchIngredients, List dataList) {
  switch (id) {
    case 0:
      return HomeContent('homeですん');
    case 1:
      return RecipeContent('レシピですん');
    case 2:
      return MealContent();
    default:
      return Text('this is error');
  }
}
