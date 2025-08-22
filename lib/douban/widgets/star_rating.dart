import 'package:flutter/material.dart';

class YZStarContent extends StatefulWidget {
  final double score;// 分数
  final double maxScore;// 总共几分
  final int starCount;// 有几颗星
  final Color starColor;
  final double starSize;
  final Widget unSelectedImage;
  final Widget selectedImage;

  YZStarContent({
    //super.key,
    required this.score,
    this.maxScore = 10,
    this.starCount = 5,
    this.starColor = Colors.red,
    this.starSize = 32,
    Widget? unSelectedImage,
    Widget? selectedImage
  }) : unSelectedImage = unSelectedImage ?? Icon(Icons.star_border, color: starColor, size: starSize),
        selectedImage = selectedImage ?? Icon(Icons.star, color: starColor, size: starSize);

  @override
  State<YZStarContent> createState() => _YZStarContentState();
}

class _YZStarContentState extends State<YZStarContent> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: _buildEmptyStars(),),
        Row(mainAxisSize: MainAxisSize.min, children: _buildFullStars(),)
      ],
    );
  }

  List<Widget> _buildEmptyStars() {
    return List.generate(widget.starCount, (index){
      return widget.unSelectedImage;
    });
  }

  List<Widget> _buildFullStars() {
    /// 实心星星
    List<Widget> stars = [];

    //一个星星几分
    double perItemScore = widget.maxScore / widget.starCount;
    // 有几个满星星
    int hasSelectedScore = (widget.score / perItemScore).floor();
    /// 实体星星
    final starItem = widget.selectedImage;

    double leftWith = ((widget.score / perItemScore) - hasSelectedScore) * widget.starSize;

    // 将整数的星星加入
    for(int i = 0; i < hasSelectedScore; i++ ){
      stars.add(starItem);
    }
    // 单独加小数部分的星星
    stars.add(
        ClipRect(
          child: starItem,
          clipper: YZStarClipper(leftWidth: leftWith),
        )
    );

    if (stars.length > widget.starCount) {
      return stars.sublist(0, widget.starCount);
    }

    return stars;
  }
}

/// 自定义继承CustomClipper的子类
class YZStarClipper extends CustomClipper<Rect> {

  final double leftWidth;

  YZStarClipper({
    required this.leftWidth,
  });

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, leftWidth, size.height);
  }

  @override
  bool shouldReclip(covariant YZStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.leftWidth != this.leftWidth;
    //当新旧不相等，则重新裁剪一下
  }
}
