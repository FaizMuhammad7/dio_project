import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hive Database',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: Hive.openBox('MyData'),
        builder: (context, snapshot) {
          return ListTile(
            tileColor: Colors.grey,
            title: Text(snapshot.data!.get('name').toString()),
            subtitle: Text(snapshot.data!.get('age').toString()),
          );
        },
      ).paddingAll(10),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('MyData');
          box.put('name', 'Faiz Muhammad');
          box.put('age', 20);
          box.put('details', {
            'pro': 'developer',
            'designation': 'backend developer',
          });

          print(box.get('name'));
          print(box.get('age'));
          print(box.get('details'));
          print(box.get('details')['pro']);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
      ),
    );
  }
}
