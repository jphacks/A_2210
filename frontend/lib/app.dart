import 'package:flutter/material.dart';
import 'package:frontend/page/home/home_detailFood.dart';
import 'page/home/home.dart';

import 'page/meal_prep_list/meal_prep_list.dart';

import 'page/recipe/recipe.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatefulWidget {
  final List? dataList;
  final Function fetchIngredients;
  const App({super.key, this.dataList, required this.fetchIngredients});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  List<String> titleList = ["ホーム", "レシピ", "作り置きリスト"];
  List iconList = [Icons.home, Icons.search, Icons.school];

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
        automaticallyImplyLeading: false,
      ),
      body: Center(
          // 引数が多くなってしまうため、Widget化せずに直接書く
          // switch文が使えないから三項演算子で書いてるけど、もっといい方法ある？
          child: _selectedIndex == 0
              ? HomeContent(context, widget.dataList, widget.fetchIngredients)
              : _selectedIndex == 1
                  ? RecipeContent('レシピですん')
                  : _selectedIndex == 2
                      ? MealContent('レシピで寸', context)
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
