
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YZImageDetailPage extends StatelessWidget {

  final String imageUrl;

  const YZImageDetailPage({
    super.key,
    this.imageUrl = ""
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Hero(
                tag: imageUrl,
                child: Image.network(imageUrl)
            )
        ),
      ),
    );
  }
}
