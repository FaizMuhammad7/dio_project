import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../models/firebase_storage_model.dart';

class FirebaseStorageController extends GetxController {

  Future<FirebaseStorageModel> fetchAllFiles(Reference reference) async {
    ListResult listResult = await reference.list();
    var files = listResult.prefixes;
    var folders = listResult.items;
    return FirebaseStorageModel(files: files, folders: folders);
  }


  Future<void> downloadFiles(Reference ref) async {
    Directory appDocDir = (await getDownloadsDirectory())!;
    var downloadDirectory = Directory("${appDocDir.path}/downloadedFiles/");
    print("downloadDirectory: ${downloadDirectory.path}");
    if (!downloadDirectory.existsSync()) {
      downloadDirectory.createSync(recursive: true);
    }

    File downloadToFile = File('${downloadDirectory.path}/${ref.name}');

    if (downloadToFile.existsSync()){
      print('File already exists');
      return;
    }


    // download with dio
    var url = await ref.getDownloadURL();
    await Dio().download(url, '${downloadDirectory.path}/${ref.name}',
        onReceiveProgress: (received, total){
          var percentage = (received/total) * 100;
          print(percentage);
        });


    try {
      var downloadTask = ref.writeToFile(downloadToFile);
      downloadTask.snapshotEvents.listen((event) {
        var received = event.bytesTransferred;
        var total = event.totalBytes;
        var percentage = (received/total) * 100;
        print(percentage);
      });
      await downloadTask.then((p0) {
        print('download completed'); });

      // Dio download
      // var url = await ref.getDownloadURL();
      // await Dio().download(url, '${downloadDirectory.path}/${ref.name}',
      //     onReceiveProgress: (received, total){
      //   var percentage = (received/total) * 100;
      //   print(percentage);
      // });


    } on FirebaseException catch (e) {
      print('Download error: $e');
    }
  }


  Future<bool> fileExists(Reference ref) async  {
    Directory appDocDir = (await getDownloadsDirectory())!;
    var downloadDirectory = Directory("${appDocDir.path}/downloadedFiles/");
    File downloadToFile = File('${downloadDirectory.path}/${ref.name}');
    return downloadToFile.existsSync();
  }

}
