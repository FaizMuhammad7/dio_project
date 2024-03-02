import 'package:flutter/material.dart';

class LayoutFiles extends StatelessWidget {
  const LayoutFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Layout Profiles'))
        ],
      ),
    );
  }
}
