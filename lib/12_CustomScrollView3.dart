import 'package:flutter/material.dart';
import 'dart:math';


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


class YZHomePage extends StatefulWidget {

  const YZHomePage({super.key});

  @override
  State<YZHomePage> createState() => _YZHomePageState();
}

class _YZHomePageState extends State<YZHomePage> {
  /// 自定义controller
  /// controller监听，可以设置初始化的默认值，也可以监听滚动的位置。
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _isShowFloatingActionButton = false;

  /// NotificationListener 监听：什么时候开始滚动、什么时候结束滚动
  /// 在这里面添加监听的操作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //添加监听
    _controller.addListener((){
      //print("正在滚动。。。。滚动位置 ${_controller.offset}");

      setState(() {
        _isShowFloatingActionButton = (_controller.offset > 1000);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("123"),
        ),
        body: NotificationListener(
          child: ListView.builder(
            itemBuilder:(BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.people),
                title: Text("联系人 $index"),

                subtitle: Text("No. ${Random().nextInt(1000)}"),
              );
            },
            itemCount: 100,
            controller: _controller,
          ),
          onNotification: (ScrollNotification notification){
              if (notification is ScrollStartNotification) {
                  print("滚动开始");
              }else if (notification is ScrollUpdateNotification) {
                print("正在滚动 总滚动距离 ${notification.metrics.maxScrollExtent}  当前滚动的位置： ${notification.metrics.pixels}");
              }else if (notification is ScrollEndNotification) {
                print("滚动结束");
              }
              return true;
         },
        ),
        floatingActionButton: _isShowFloatingActionButton ? FloatingActionButton(//浮窗按钮
          onPressed: (){
            print("FloatingActionButton");

            _controller.animateTo(0.0, duration: Duration(milliseconds: 100), curve: Curves.linear);
          },
          child: Icon(Icons.arrow_upward),
        ) : null,
    );
  }
}
