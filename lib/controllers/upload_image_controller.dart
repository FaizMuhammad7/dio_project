import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../helpers/all_mime_type.dart';

class UploadImageController extends GetxController {

  var percentage = 0.0.obs;

  Future<String> uploadImage(String filepath, Reference ref) async {
    var extension = filepath.split('.').last;
    var fileName = filepath.split('/').last;
    UploadTask uploadTask = ref.child(fileName).putData(
      File(filepath).readAsBytesSync(),
      SettableMetadata(
        contentType: allMimeTypesMap[extension],
      ),
    );

    uploadTask.snapshotEvents.listen((snapshot) {
       percentage.value = snapshot.bytesTransferred / snapshot.totalBytes ;
      print(percentage);
    });

    TaskSnapshot taskSnapshot = await uploadTask;
    var imageUrl = taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
