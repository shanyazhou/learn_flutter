import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Yzhomeaboutview extends StatelessWidget {
  static const String routeName = "/about";
  final String message;

  Yzhomeaboutview({
    super.key,
    this.message = "",
  });

  @override
  Widget build(BuildContext context) {

    final  String message = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("这里是关于页"),
                Text("外界带过来的信息：$message"),
                TextButton(onPressed: (){
                  Navigator.of(context).pop("返回'关于页面'的按钮携带的信息");
                }, child: Text("返回按钮"))
              ]
          )
      ),
    );
  }
}
