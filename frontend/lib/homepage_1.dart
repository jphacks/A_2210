import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ("HOME"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*カテゴリボタン */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  //調理不可ボタン
                  onPressed: () {},
                  child: Text(
                    "調理不可",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                ElevatedButton(
                  //調理可ボタン
                  onPressed: () {},
                  child: Text(
                    "調理可",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ],
            ),
            Card(
              child: Container(
                height: 50,
                color: Colors.blue,
              ),
            ),
            // Container(
            //   width: 400,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     color: Colors.grey[100],
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
