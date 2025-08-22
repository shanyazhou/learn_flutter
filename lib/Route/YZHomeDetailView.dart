import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class YZHomeDetailPage extends StatefulWidget {
  final String message;

  YZHomeDetailPage({
    super.key,
    this.message = "",
  });

  @override
  State<YZHomeDetailPage> createState() => _YZHomeDetailPageState();
}

class _YZHomeDetailPageState extends State<YZHomeDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop("返回按钮携带的信息2");
          },
        ),

        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("这里是详情页"),
                Text("这里是外界传过来的信息：${widget.message}"),
                TextButton(onPressed: (){
                  Navigator.of(context).pop("返回按钮携带的信息");
                }, child: Text("返回按钮"))
              ]
          )
      ),
    );
  }
}
