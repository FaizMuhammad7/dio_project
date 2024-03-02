import 'package:dio_project/hive_boxes/hive_box.dart';
import 'package:dio_project/hive_models/example2_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '../../hive_controller/example2_controller.dart';

class HiveExample2 extends StatefulWidget {

  @override
  State<HiveExample2> createState() => _HiveExample2State();
}

class _HiveExample2State extends State<HiveExample2> {
  final titleController = TextEditingController();
  final desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Example2Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crud Operation In Hive',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder<Box<Example2Model>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<Example2Model>();
          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.deleteData(data[index]);
                  },
                  child: ListTile(
                    tileColor: Colors.grey,
                    title: Text(data[index].title.toString()),
                    subtitle: Text(data[index].description.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        editData(
                          data[index],
                          data[index].title.toString(),
                          data[index].description.toString(),
                        );
                      },
                    ),
                  ),
                );
              });
        },
      ).paddingAll(12),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Note'),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            labelText: 'Enter your title',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: desController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            labelText: 'Enter your description',
                            border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      var addData = Example2Model(
                          title: titleController.text,
                          description: desController.text);
                      var box = Boxes.getData();
                      box.add(addData);
                      addData.save();
                      titleController.clear();
                      desController.clear();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
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

  Future<void> editData(
      Example2Model example2model, String title, String description) async {
    titleController.text = title;
    desController.text = description;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(),
          title: Text('Edit Note'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Enter your title',
                      border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: desController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Enter your description',
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Edit'),
              onPressed: () {
                example2model.title = titleController.text;
                example2model.description = desController.text;
                example2model.save();
                titleController.clear();
                desController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
