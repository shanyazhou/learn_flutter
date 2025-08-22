import 'dart:ffi';
import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

//  1. 创建一个全局的EventBus对象
final eventBus = EventBus();

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

class _YZHomePageState extends State<YZHomePage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  Animation<double>? _animation;
  Animation<double>? _sizeAnimation;
  Animation<Color>? _colorAnimation;
  Animation<double>? _opacityAnimation;
  Animation<double>? _radianAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // 设置Curved（速率）
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    _sizeAnimation = Tween<double>(begin : 50.0, end: 150.0).animate(_controller) as Animation<double>;

    //_colorAnimation = ColorTween(begin: Colors.lime, end: Colors.red).animate(_controller) as Animation<Color>;

    _opacityAnimation = Tween<double>(begin : 0.0, end: 1.0).animate(_controller) as Animation<double>;

    _radianAnimation = Tween<double>(begin : 0.0, end: 1.0).animate(_controller) as Animation<double>;
    // 监听动画的状态
    _controller.addStatusListener((AnimationStatus status){
      if (status == AnimationStatus.completed){
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child){
                  return Transform(
                    transform: Matrix4.rotationZ(_radianAnimation?.value ?? 0.0),
                    alignment: Alignment.center,
                    child: Container(
                    width: _sizeAnimation?.value,
                    height: _sizeAnimation?.value,
                    color: Colors.blue.withOpacity(_opacityAnimation?.value ?? 0.5),
                    ),
                  );
                },

              )
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            if (_controller.isAnimating) {
              _controller.stop();
            }else {
              if (_controller.status == AnimationStatus.forward) {
                _controller.forward();
              }else if (_controller.status == AnimationStatus.reverse) {
                _controller.reverse();
              }else {
                _controller.forward();
              }
            }
          }
      ), //
    );
  }
}
