import 'package:flutter/material.dart';
import 'dart:math';


/// 创建一个继承InheritedWidget的子类
class YZCounterWidget extends InheritedWidget {

  // 1. 共享的数据
  final int counter;

  // 2. 构造方法
  YZCounterWidget({
    required super.child,
    this.counter = 0
  });

  // 3. 获取组件最近的当前InheritedWidget
  static YZCounterWidget? of(BuildContext context) {
    /// 沿着Element树，找最近的YZCounterElement，从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4. 决定要不要回调didChangeDependencies  方法
  @override
  bool updateShouldNotify(YZCounterWidget oldWidget) {
    return oldWidget.counter != counter;//true执行
  }
}

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

  int _counter = 109;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget使用"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: YZCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YZHomeShowData01(),
              YZHomeShowData02(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class YZHomeShowData01 extends StatefulWidget {
  const YZHomeShowData01({super.key});

  @override
  State<YZHomeShowData01> createState() => _YZHomeShowData01State();
}

class _YZHomeShowData01State extends State<YZHomeShowData01> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_YZHomeShowData01State执行了didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int? counter = YZCounterWidget.of(context)?.counter;

    return Card(
      color: Colors.greenAccent,
      child: Text("当前计数是：$counter"),
    );
  }
}

class YZHomeShowData02 extends StatelessWidget {

  const YZHomeShowData02({super.key});

  @override
  Widget build(BuildContext context) {
    int? counter = YZCounterWidget.of(context)?.counter;

    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
      ),
      child: Text("当前计数是：$counter"),
    );
  }
}

