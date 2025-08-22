import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/YZScreenSizeFit.dart';
import 'Extention/double_extention.dart';
import 'Extention/int_extention.dart';

void main(){
  //调用runApp函数
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    YZScreenSizefit.initialize();
    print("---${YZScreenSizefit.screenHeight}");

    return MaterialApp(//保持整个app是Material风格
        debugShowCheckedModeBanner: false,//去掉右上角的debug
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
        title: Text("分辨率演示"),
      ),
      body: YZContentBody(),
    );
  }
}

class YZContentBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 获取主题颜色
    final theme = Theme.of(context);

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child: Center(child: Text("正常尺寸")),
            ),
            SizedBox(height: 20,),

            Container(
              width:  YZScreenSizefit.setPx(200),
              height: YZScreenSizefit.setPx(100),
              color: Colors.blueAccent,
              child: Center(child: Text("setPx(200)")),
            ),
            SizedBox(height: 20,),

            Container(
              width: 200.0.px(),
              height: 100.0.px(),
              color: Colors.red,
              child: Center(child: Text("200.0.px()")),
            ),
            SizedBox(height: 20,),

            Container(
              width: 200.px(),
              height: 100.px(),
              color: Colors.purple,
              child: Center(child: Text("200.px()",)),
            ),
            SizedBox(height: 20,),

            Container(
              width: 200.0.getPx,
              height: 100.0.getPx,
              color: Colors.yellow,
              child: Center(child: Text("200.0.getPx")),
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}