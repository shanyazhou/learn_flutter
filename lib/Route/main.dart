import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'YZHomeAboutView.dart';
import 'YZHomeDetailView.dart';


main() => runApp(MyApp());

//  1. 创建一个全局的EventBus对象
final eventBus = EventBus();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YZHomePage(),
      routes: {
        Yzhomeaboutview.routeName: (BuildContext context){
          return Yzhomeaboutview(message: "123",);
        }
      },
      // 钩子函数
      onGenerateRoute: (RouteSettings settings){
        if (settings.name == "/detail") {
          return MaterialPageRoute(builder: (context){
            return YZHomeDetailPage(message: settings.arguments as String,);
          });
        }
        return null;
      }, 
    );
  }
}

class YZHomePage extends StatefulWidget {

  @override
  State<YZHomePage> createState() => _YZHomePageState();
}

class _YZHomePageState extends State<YZHomePage> {

  String _backMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      /// 方法一：
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (BuildContext context){
                      //     return YZHomeDetailPage();
                      //    }
                      //   )
                      // );
                      /// 方法二：
                      Future resule = Navigator.push(context,
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return YZHomeDetailPage(message: "123");
                            },
                          )
                      );
                      resule.then((res){
                        setState(() {
                          this._backMessage = res;
                        });
                      });
                    },
                    child: Text("跳转到详情页"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                    ),
                ),

                Text(_backMessage),

                TextButton(
                  onPressed: (){
                    Future resule = Navigator.of(context).pushNamed(Yzhomeaboutview.routeName, arguments: "传入到关于的信息");
                    resule.then((res){
                      setState(() {
                        this._backMessage = res;
                      });
                    });
                  },
                  child: Text("跳转到关于页"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  ),
                ),

                TextButton(
                  onPressed: (){
                    Future resule = Navigator.push(context,
                        MaterialPageRoute(
                            builder: (BuildContext context){
                              return YZHomeDetailPage(message: "123");
                            },
                            fullscreenDialog: true
                        )
                    );
                    resule.then((res){
                      setState(() {
                        this._backMessage = res;
                      });
                    });
                  },
                  child: Text("从下往上出现跳转到详情页"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Future resule = Navigator.push(context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2){
                              return FadeTransition(
                                  opacity: animation1,
                                  child: YZHomeDetailPage(message: "123")
                              );
                            },
                            fullscreenDialog: true
                        )
                    );
                    resule.then((res){
                      setState(() {
                        this._backMessage = res;
                      });
                    });
                  },
                  child: Text("自定义转场效果跳转到详情页"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  ),
                ),

              ]
          )
      ),
    );
  }
}
