import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'firebase_storage_controller.dart';
import 'upload_image_controller.dart';
import '../../helpers/permission_handler.dart';
import 'firebase_storage_model.dart';

class FetchFileFirebaseStorage extends StatelessWidget {
  final Reference ref;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FirebaseStorageController());
    var imageController = Get.put(UploadImageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.name == '' ? 'Fetch all files' : ref.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<FirebaseStorageModel>(
        future: controller.fetchAllFiles(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            var files = snapshot.data?.files ?? [];
            var folders = snapshot.data?.folders ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...files.map((e) => FileItem(item: e, isFile: true)).toList(),
                  ...folders
                      .map((e) => FileItem(item: e, isFile: false))
                      .toList(),
                ],
              ),
            );
          }
          return Text('No files exist');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var selectedImage =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (selectedImage != null) {
            print(selectedImage.path);
            await imageController.uploadImage(
              selectedImage.path,
              ref,
            );
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
      ),
    );
  }

  FetchFileFirebaseStorage({
    required this.ref,
  });
}

// class FileItem
class FileItem extends StatelessWidget {
  final Reference item;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FirebaseStorageController());

    return ListTile(
      title: Text(item.name),
      leading: isFile
          ? Icon(
              Icons.file_copy,
              color: Colors.amber,
            )
          : null,
      trailing: isFile
          ? null
          : IconButton(
              onPressed: () async {
                var status = await MyPermissionUtils.askStoragePermission();
                // var allowed = await Permission.storage.request();
                controller.downloadFiles(item);

                if (status) {
                  controller.downloadFiles(item);
                } else {
                  print('Storage Permissions not allowed');
                }
              },
              icon: FutureBuilder<bool>(
                  future: controller.fileExists(item),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return Icon(
                        Icons.check,
                        color: Colors.green,
                      );
                    }
                    return Icon(Icons.download);
                  },
              ),
            ),
      onTap: isFile
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FetchFileFirebaseStorage(
                    ref: item,
                  ),
                ),
              );
            }
          : null,
    );
  }

  const FileItem({
    required this.item,
    required this.isFile,
  });
}
