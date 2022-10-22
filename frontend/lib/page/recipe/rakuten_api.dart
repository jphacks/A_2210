import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RakutenApi extends StatefulWidget {
  final String? isSelectedItem;
  const RakutenApi({super.key, this.isSelectedItem});

  @override
  State<RakutenApi> createState() => _RakutenApi();
}

class _RakutenApi extends State<RakutenApi> {
  String recipeUrl = "";

  void fetchRecipe() async {
    final dio = Dio();
    final id = dotenv.get("RAKUTEN_APPLICATION_ID");
    final parm =
        'format=json&categoryType=small&elements=categoryName%2CcategoryUrl&applicationId=${id}';
    final url =
        'https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?${parm}';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        final data = response.data["result"]["small"];
        for (var i = 0; i < data.length; i++) {
          if (data[i]["categoryName"] == widget.isSelectedItem) {
            setState(() {
              recipeUrl = data[i]["categoryUrl"];
            });
          }
        }
        ;
        print(recipeUrl);
      } catch (e) {
        throw e;
      }
    }
  }

  void _openUrl() async {
    final uri = Uri.parse(recipeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("レシピ詳細")),
      body: Column(children: [
        OutlinedButton(onPressed: _openUrl, child: Text('openUrl')),
        OutlinedButton(onPressed: fetchRecipe, child: Text("api")),
        Text(recipeUrl.toString())
      ]),
    );
  }
}
