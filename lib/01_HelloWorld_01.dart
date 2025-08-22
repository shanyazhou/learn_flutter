import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  //调用runApp函数
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//保持整个app是Material风格
        debugShowCheckedModeBanner: false,//去掉右上角的debug
        home: YZHomePage()
    );
  }
}

class YZHomePage extends StatelessWidget
{
  static const String routeName = "/01_HelloWorld_01";
  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架
        appBar: AppBar(
          title: Text("这是san个标题"),
          backgroundColor: Colors.orange,//navigarion的颜色
        ),
        body: YZContentBody()
    );
  }
}

class YZContentBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            "Hello World",
            textDirection: TextDirection.ltr,//从左到右
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepOrange
            ))
    );
  }
}