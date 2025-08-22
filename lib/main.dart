import 'dart:ffi';

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
        title: "Theme Demo",
        debugShowCheckedModeBanner: false,//去掉右上角的debug
        theme: ThemeData(
          // 亮度
          brightness: Brightness.light,
          primarySwatch: Colors.red
        ),
        home: YZHomePage()
    );
  }
}

class YZHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架
      appBar: AppBar(
        title: Text("主题演示"),
        // 移除 backgroundColor，让它使用主题的 primaryColor
      ),
      body: YZContentBody()
    );
  }
}

class YZContentBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return YZContentBodyState();
  }
}

class YZContentBodyState extends State<YZContentBody>{
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          ///对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: selected,
                  onChanged: (value){
                    setState(() {
                      selected = !selected;
                    });
                  }),
              Text("同意协议"),
            ]

        )
    );
  }
}


