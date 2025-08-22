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
        title: "主题演示",
        debugShowCheckedModeBanner: false,//去掉右上角的debug
        theme: ThemeData(
          // 亮度
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          // 明确设置 primaryColor
          primaryColor: Colors.green,

          // 统一textButtonTheme的一些配置
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(10, 100)),
                backgroundColor: MaterialStateProperty.all(Colors.greenAccent)
            )
          ),

          // 统一Card的一些配置
          cardTheme: CardTheme(
              color: Colors.yellow
          ),
          // // 设置 AppBar 主题
          // appBarTheme: AppBarTheme(
          //   backgroundColor: Colors.red,
          //   foregroundColor: Colors.white,
          // ),
          // 设置 FloatingActionButton 主题
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),

        //暗黑模式
        darkTheme: ThemeData(
          cardTheme: CardTheme(
              color: Colors.grey
          ),
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
          title: Text("Theme Study"),
        ),
        body: YZContentBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "首页",
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                label: "我的",
                icon: Icon(Icons.person)
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              print("object");
            }
        ),
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
            Text(
                "Hello World",
                textDirection: TextDirection.ltr,//从左到右
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepOrange
                )),
            Switch(value: true, onChanged: (value){
              print("Switch changed: $value");
            }),

            /// iOS系统的样式
            CupertinoSwitch(value: true, onChanged: (value){}),
            
            TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return YZHomeDetailPage();
                  }));
                },
                child: Text("c"),
                // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            ),

            Card(
              child: Text("这是一个Card"),
            )
          ],
        )
    );
  }
}

class YZHomeDetailPage extends StatelessWidget {
  const YZHomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      // 重新搞一个ThemeData
      // data: ThemeData(
      //   // 自己的ThemeData，以及CardTheme
      //   cardTheme: CardTheme(
      //       color: Colors.redAccent
      //   ),
      // ),

      data: Theme.of(context).copyWith(
        cardTheme: CardTheme(
          color: Colors.purple
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Text("1222222222"),
              ),
              TextButton(onPressed: (){}, child: Text("123"))
            ],
          ),
        ),
      ),
    );
  }
}
