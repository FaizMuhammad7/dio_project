import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../hive_models/example2_model.dart';

class Example2Controller extends GetxController{
final titleController = TextEditingController();
final desController = TextEditingController();

  // Future<void> editData(
  //     Example2Model example2model, String title, String description) async {
  //   titleController.text = title;
  //   desController.text = description;
  //
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(),
  //         title: Text('Edit Note'),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               TextField(
  //                 controller: titleController,
  //                 decoration: InputDecoration(
  //                     contentPadding: EdgeInsets.symmetric(horizontal: 8),
  //                     hintText: 'Enter your title',
  //                     border: OutlineInputBorder()),
  //               ),
  //               SizedBox(height: 10),
  //               TextField(
  //                 controller: desController,
  //                 decoration: InputDecoration(
  //                     contentPadding: EdgeInsets.symmetric(horizontal: 8),
  //                     hintText: 'Enter your description',
  //                     border: OutlineInputBorder()),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Edit'),
  //             onPressed: () {
  //               example2model.title = titleController.text;
  //               example2model.description = desController.text;
  //               example2model.save();
  //               titleController.clear();
  //               desController.clear();
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  void deleteData(Example2Model example2model) async {
    await example2model.delete();
  }

}