import 'package:flutter/material.dart';
import 'dart:math' as math; // 引入数学库用于π的计算

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
        backgroundColor: Colors.green,
      ),
      body: YZHomeTextContent(),
      floatingActionButton: FloatingActionButton(//浮窗按钮
        onPressed: (){
          print("FloatingActionButton");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class YZHomeTextContent extends StatefulWidget {
  const YZHomeTextContent({super.key});

  @override
  State<YZHomeTextContent> createState() => _YZHomeTextContentState();
}

class _YZHomeTextContentState extends State<YZHomeTextContent> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 200,
        child: Align(
          alignment: Alignment(0.7, 0.6),//中心点是（0，0）
          child: Transform.rotate(
            angle: math.pi/(3),
            child: Icon(
              Icons.pets,
              size: 50,
              color: Colors.red,
            ),
          )
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(
              Radius.elliptical(10, 10)
          ),
        ),
    );
  }
}
