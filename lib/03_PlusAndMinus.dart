import 'package:flutter/material.dart';

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

class YZHomePage extends StatelessWidget {
  static const String routeName = "/03_PlusAndMinus";
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加减法"),
      ),
      body: YZHomeContent("你好，世界~"),
    );
  }
}

class YZHomeContent extends StatefulWidget {
  final String message;
  YZHomeContent(this.message);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _YZHomeContentState();
  }
}

class _YZHomeContentState extends State<YZHomeContent> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//上下居中
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,//左右居中
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Icon(Icons.add),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                )
                ),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){
                setState(() {
                  _count--;
                });
              }, child: Text("点击-"))
            ],
          ),
          Text("当前计数：$_count", style: TextStyle(fontSize: 25)),
          Text("传递的信息：${this.widget.message}")
        ],
      ),
    );
  }
}
