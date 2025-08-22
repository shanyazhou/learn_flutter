import 'package:flutter/material.dart';
import 'package:learn_flutter/08_%E6%BB%9A%E5%8A%A8Widget.dart';

import '../../widgets/dotted_line.dart';
import '../../widgets/star_rating.dart';

class YZHomeMovieItem extends StatelessWidget {
  const YZHomeMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      ///添加底部间距
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 10
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 上
          movieItemTopInfo(),
          SizedBox(height: 6,),
          // 中
          movieItemMiddleInfo(),
          SizedBox(height: 6,),
          // 下
          movieItemBottomInfo(),
        ],
      ),
    );
  }
}

Widget movieItemTopInfo() {
  return Container(
    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
    decoration: BoxDecoration(
      color: Colors.amberAccent,
      borderRadius: BorderRadius.circular(3.0)
    ),
    child: Text("No.1", style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 131, 95, 36)),),
    clipBehavior: Clip.none
  );
}

Widget movieItemMiddleInfo() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      /// 图片+圆角
      ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.asset("assets/images/1211.png", height: 150,),
      ),

      Expanded(//可伸缩的
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.play_circle_outlined, color: Colors.red,),
                Text("肖申克的救赎", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text("(1994)", style: TextStyle(fontSize: 15, color: Colors.grey),),
              ],
            ),
            SizedBox(height: 6,),
            Row(
              children: [
                YZStarContent(score: 9.2, starSize: 20, starColor: Colors.amberAccent, ),
                SizedBox(width: 6,),
                Text("9.7")
              ],
            ),
            SizedBox(height: 6,),
            //Text('data'),
            Text(
              "犯罪 剧情/弗兰克德拉邦德/细目罗宾斯摩根弗拉米基尔普丁",
              maxLines: 3,///最大行数
              overflow: TextOverflow.ellipsis,///如果被省略了，省略号结束
              textScaleFactor: 1.2,)
          ]
        ),
      ),

      Container(
        height: 100,
        child: YZDottedLine(
          axis: Axis.vertical,
          width: 1,
          height: 2,
          count: 15,
          color: Colors.lime,
        ),
      ),
      SizedBox(width: 6,),
      Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo_outlined, color: Colors.yellow,),
            Text("想看", style: TextStyle(color: Colors.yellow, fontSize: 18), )
          ],
        ),
      )

    ],
  );
}

Widget movieItemBottomInfo() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color:Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(3.0)
    ),
    child: Text("The Shawshank Redemotion"),
  );
}