import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

/// 共享数据 with是混入，也就是非继承但是可以有ChangeNotifier所以的方法和属性
class YZCounterViewModel with ChangeNotifier{
  int _counter = 10;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    /// 通知所有的监听者
    notifyListeners();
  }
}

main() {
  runApp(
    // 单个的
    // ChangeNotifierProvider(
    //   create: (BuildContext context) {
    //     return YZCounterViewModel();
    //   },
    //   child: MyApp()
    // ),

    // 多个的
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return YZCounterViewModel();
          },
        ),
        // 多个
        // ...
      ],
      child: MyApp(),
    )
  );
}

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
        title: Text("InheritedWidget使用"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YZHomeShowData01(),
            YZHomeShowData02(),
            YZHomeShowData03(),
          ],
        ),
      ),

      // 使用Consumer
      // floatingActionButton: Consumer<YZCounterViewModel> (
      //   builder: (context, contextVM, child){
      //     print("floatingActionButton builder 被执行");
      //     return FloatingActionButton(
      //             child: child,
      //             onPressed: (){
      //               // 不需要加 setState
      //               // setState(() {
      //               //   contextVM.counter++;
      //               // });
      //               contextVM.counter++;
      //             },
      //           );
      //   },
      //   child:  Icon(Icons.add),//放在这，是为了不被每次重建
      // )

        // 使用 Selector
        floatingActionButton: Selector<YZCounterViewModel, YZCounterViewModel> (
          builder: (context, contextVM, child){
            print("floatingActionButton builder 被执行");
            return FloatingActionButton(
              child: child,
              onPressed: (){
                // 不需要加 setState
                // setState(() {
                //   contextVM.counter++;
                // });
                contextVM.counter++;
              },
            );
          },
          selector: (buildContext, viewModel){
            return viewModel;
          },
          /// 是否需要重新构建
          shouldRebuild: (previous, next){
            return false;// 不需要重新构建
          },
          child:  Icon(Icons.add),//放在这，是为了不被每次重建
        )
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
    int counter = Provider.of<YZCounterViewModel>(context).counter;
    print("YZHomeShowData01-build");
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
    int counter = Provider.of<YZCounterViewModel>(context).counter;
    print("YZHomeShowData02-build");
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
      ),
      child: Text("当前计数是：$counter"),
    );
  }
}

class YZHomeShowData03 extends StatelessWidget {

  const YZHomeShowData03({super.key});

  @override
  Widget build(BuildContext context) {
    print("YZHomeShowData03-build");
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
      ),
      child: Consumer<YZCounterViewModel>(
        builder: (context, viewModel, child) {
          print("YZHomeShowData03-Consumer-build");
          return Text("当前计数是：${viewModel.counter}");
        }
      )
    );
  }
}

