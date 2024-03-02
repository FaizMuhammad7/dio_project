import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index){
          return Container(
            height: 150,
            width: 150,
            child: Image.network(""),
          );
        },
      ).paddingAll(10),
    );
  }
}
