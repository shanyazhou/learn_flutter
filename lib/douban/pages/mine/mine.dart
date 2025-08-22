import 'package:flutter/material.dart';

class YZMinePage extends StatelessWidget {
  const YZMinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: YZMineContent(),
    );
  }
}

class YZMineContent extends StatefulWidget {
  const YZMineContent({super.key});

  @override
  State<YZMineContent> createState() => _YZMineContentState();
}

class _YZMineContentState extends State<YZMineContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("这里是我的"),
    );
  }
}
