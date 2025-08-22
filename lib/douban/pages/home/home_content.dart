import 'package:flutter/material.dart';

import 'home_movie_item.dart';

class YZHomeContent extends StatefulWidget {
  const YZHomeContent({super.key});

  @override
  State<YZHomeContent> createState() => _YZHomeContentState();
}

class _YZHomeContentState extends State<YZHomeContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
          return YZHomeMovieItem();
        }
    );
  }
}
