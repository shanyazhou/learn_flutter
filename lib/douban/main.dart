import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/main.dart';
import 'package:learn_flutter/douban/widgets/dotted_line.dart';
import 'package:learn_flutter/douban/widgets/star_rating.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,// 飞溅颜色
        highlightColor: Colors.transparent,//选中颜色设置为透明
        colorScheme: ColorScheme.light(
          primary: Colors.green, // 主要颜色
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen, // 统一设置 AppBar 背景色
          foregroundColor: Colors.white,      // 标题、图标等前景色
        ),
      ),
      home: YZMainPage(),
    );
  }
}
