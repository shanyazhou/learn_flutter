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
                YZDemoButton(),
                YZDemoText()
              ]
          )
      ),
    );
  }
}

class YZDemoButton extends StatelessWidget {
  const YZDemoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          // 2. 发出事件
          eventBus.fire("This is changed message");
        },
        child: Text("This is a button"),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),

    );
  }
}

class YZDemoText extends StatefulWidget {
  const YZDemoText({super.key});

  @override
  State<YZDemoText> createState() => _YZDemoTextState();
}

class _YZDemoTextState extends State<YZDemoText> {
  String message = "This is a message";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 3. 监听事件
    eventBus.on<String>().listen((data){
      setState(() {
        message = data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
