import 'package:flutter/material.dart';

class YZDottedLine extends StatelessWidget {

  final Axis axis;
  final int count;
  final Color color;
  final double width;
  final double height;

  YZDottedLine({
    this.axis = Axis.horizontal,
    this.count = 10,
    this.color = Colors.red,
    this.width = 10,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,// 分开
      children: List.generate(count, (_){
        return SizedBox(
            width: width,
            height: height,
            child: DecoratedBox (
              decoration: BoxDecoration(color: color),
            )
        );
      }),
    );
  }
}

//使用
// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// width: 200,
// child: YZDottedLine(color: Colors.blueAccent,),
// ),
// Container(
// height: 200,
// child: YZDottedLine(axis: Axis.vertical, width: 1, height: 10, color: Colors.blueAccent,),
// ),
// ],
// ),
// )

