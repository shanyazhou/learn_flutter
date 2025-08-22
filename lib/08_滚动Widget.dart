import 'package:flutter/material.dart';
import 'dart:math';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: YZHomePage(),
    );
  }
}

class YZHomeButtonPage extends StatelessWidget {
  const YZHomeButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class YZHomePage extends StatelessWidget {
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget布局"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: YZHomeListViewContent(),
    );
  }
}

class YZHomeListViewContent extends StatefulWidget {
  const YZHomeListViewContent({super.key});

  @override
  State<YZHomeListViewContent> createState() => _YZHomeListViewContentState();
}

class _YZHomeListViewContentState extends State<YZHomeListViewContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,// cell个数
        itemExtent: 64,// 设置行高（不设置的话，内容填充）
        itemBuilder: (BuildContext context, int index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Word~ ${index + 1}", style: TextStyle(fontSize: 20, color: Colors.brown),),//忘记加return了，注意下
              Divider(height: 1,)
            ],
          );
        },
    );
      // ListView(
      // children: [
      //   Text("data"),
      //   Text("data2"),
      //   Text("data3"),
      // ],

      // children: List.generate(100, (index){
      //   //return Text("Hello World! $index", style: TextStyle(color: getRandomColor(), fontSize: 25));
      //
      //   return ListTile(
      //     leading: Icon(Icons.people),
      //     trailing: Icon(Icons.delete),
      //     title: Text("联系人! $index", style: TextStyle(color: getRandomColor(), fontSize: 25)),
      //     subtitle: Text("180012000"),
      //   );
      // })
    // );
    

  }
}


Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    random.nextInt(256), // 透明度 (0-255)
    random.nextInt(256), // 红色 (0-255)
    random.nextInt(256), // 绿色 (0-255)
    random.nextInt(256), // 蓝色 (0-255)
  );
}