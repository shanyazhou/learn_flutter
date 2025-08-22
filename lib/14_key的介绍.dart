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
  final List names = ["aaaa", "bbbb", "cccc"];

  //YZHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget布局"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView(
        children: List.generate(names.length, (index) {
          return YZListItemFul(key: ValueKey(names[index]), name: names[index]);
        })
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class YZListItemLess extends StatelessWidget {

  final String name;
  final Color randColor = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  /// 两种构造方法
  YZListItemLess({
    super.key,
    this.name = "",
  });

  // YZListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: randColor,
      child: Text(name + "1212"),
    );
  }
}


class YZListItemFul extends StatefulWidget {

  final String name;

  /// 两种构造方法
  YZListItemFul({
    super.key,
    this.name = "",
  });

  @override
  State<YZListItemFul> createState() => _YZListItemFulState();
}

class _YZListItemFulState extends State<YZListItemFul> {
  final Color randColor = Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: randColor,
      child: Text(widget.name + "1212"),
    );
  }
}
