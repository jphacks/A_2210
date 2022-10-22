import 'package:flutter/material.dart';
import 'package:frontend/page/home/home_detailFood.dart';
import 'package:frontend/page/recipe/rakuten_api.dart';
import 'page/home/home.dart';
import 'page/meal_prep_list/meal_prep_list.dart';
import 'page/recipe/recipe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/page/recipe/rakuten_api.dart';

class App extends StatefulWidget {
  final List ingredientsStockList;
  final Function fetchIngredientsStock;
  const App(
      {super.key,
      required this.ingredientsStockList,
      required this.fetchIngredientsStock});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  List<String> titleList = ["ホーム", "レシピ", "作り置きリスト"];
  List iconList = [Icons.home, Icons.search, Icons.school];
  var _toggleList = <bool>[false, false];
  List ingredientsList = [];

  void fetchIngredients() async {
    final dio = Dio();
    final id = dotenv.get('APPLICATION_ID');
    final key = dotenv.get('API_KEY');
    final url = 'https://api.airtable.com/v0/$id/ingredients';
    List list = [];
    final response = await dio.get(url,
        options: Options(
          headers: {"Authorization": "Bearer $key"},
        ));

    if (response.statusCode == 200) {
      try {
        final data = response.data;
        setState(() {
          ingredientsList = data["records"];
        });
        print('ingredient通信成功');
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

  void toggleButtonOnPressed(int index) {
    setState(() {
      _toggleList[index] = !_toggleList[index];
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
              ? HomeContent(
                  context,
                  widget.ingredientsStockList,
                  widget.fetchIngredientsStock,
                  ingredientsList,
                  fetchIngredients,
                  toggleButtonOnPressed,
                  _toggleList)
              : _selectedIndex == 1
                  ? RecipeContent(context, widget.ingredientsStockList)
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
        iconSize: 23,
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedFontSize: 13,
      ),
    );
  }
}
