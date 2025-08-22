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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件学习"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YZTouchPointer(),
            SizedBox(height: 20,),
            YZGestureWidget(),
            SizedBox(height: 20,),
            YZGesture2Widget(),
          ]
        )
      ),
    );
  }
}

class YZTouchPointer extends StatelessWidget {
  const YZTouchPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event){
        print("onPointerDown");
        print(event.position);// 相当于整个屏幕
        print(event.localPosition); // 相当于本身
      },
      onPointerMove: (event){
        print("onPointerMove");
      },
      onPointerUp: (event){
        print("onPointerUp");
      },
      onPointerCancel: (event){
        print("onPointerCancel");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.amber,
      ),
    );
  }
}

class YZGestureWidget extends StatelessWidget {
  const YZGestureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event){
        print("onTapDown");
        print(event.localPosition);//相当于本控件的
        print(event.globalPosition);//全局的
      },
      onTap: (){
        print("onTap");
      },
      onTapUp: (event){
        print("onPoionTapUpnterUp");
      },
      onTapCancel: (){
        print("onTapCancel");
      },
      onDoubleTap: (){
        print("onDoubleTap");
      },
      onLongPress: (){
        print("onLongPress");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.greenAccent,
      ),
    );
  }
}

class YZGesture2Widget extends StatelessWidget {
  const YZGesture2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTapDown: (detail) {
            print("detail1");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTapDown: (detail) {
            print("detail2");
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
