import 'package:flutter/material.dart';
import 'dart:math';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YZHomePage(),
    );
  }
}

class YZHomePage extends StatefulWidget {
  @override
  State<YZHomePage> createState() => _YZHomePageState();
}

class _YZHomePageState extends State<YZHomePage> {
  //YZHomePage({super.key});

  final GlobalKey<_YZHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget布局"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: YZHomeContent(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.change_circle),
        onPressed: (){
          // 获取子类里面的数据
          print(homeKey.currentState?.message);
          print(homeKey.currentState?.widget.name);
          // 执行方法
          homeKey.currentState?.test();
        },
      ),
    );
  }
}

class YZHomeContent extends StatefulWidget {

  final String name = "Jack";

  const YZHomeContent({super.key});

  @override
  State<YZHomeContent> createState() => _YZHomeContentState();
}

class _YZHomeContentState extends State<YZHomeContent> {

  final String message = "1234";

  void test() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}

