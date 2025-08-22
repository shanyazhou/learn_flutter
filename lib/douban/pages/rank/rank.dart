import 'package:flutter/material.dart';

class YZRankPage extends StatelessWidget {
  const YZRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("榜单"),
      ),
      body: YZRankContent(),
    );
  }
}

class YZRankContent extends StatefulWidget {
  const YZRankContent({super.key});

  @override
  State<YZRankContent> createState() => _YZRankContentState();
}

class _YZRankContentState extends State<YZRankContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("这里是榜单"),
    );
  }
}
