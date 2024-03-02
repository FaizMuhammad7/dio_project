// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:video_compress/video_compress.dart';
//
// class CompressVideoController extends GetxController {
//   /// video compress method
//   compressVideo(String videoFilePath) async {
//     final compressVideoFilePath = await VideoCompress.compressVideo(
//       videoFilePath,
//       quality: VideoQuality.MediumQuality,
//     );
//     return compressVideoFilePath!.file;
//   }
//
//   /// upload video on firebase storage
//
//   uploadVideoFile(String videoId, String videoFilePath) async {
//     var videoPath = await compressVideo(videoFilePath);
//     UploadTask videoUploadTask = FirebaseStorage.instance.ref()
//         .child("All videos").child(videoId).putFile(videoPath);
//     TaskSnapshot snapshot = await videoUploadTask;
//     String videoDownloadUrl = await snapshot.ref.getDownloadURL();
//     return videoDownloadUrl;
//   }
//
//   /// get video thumbnail
//   getVideoThumbnail(String videoFilePath) async {
//     final videoThumbnail = await VideoCompress.getFileThumbnail(videoFilePath);
//     return videoThumbnail;
//   }
//
//
//
//   /// upload video thumbnail on firebase storage
//   uploadVideoThumbnail(String videoId, String videoFilePath) async {
//     var thumbnailPath = await getVideoThumbnail(videoFilePath);
//     UploadTask thumbnailUploadTask = FirebaseStorage.instance.ref()
//         .child("All videos").child(videoId).putFile(thumbnailPath);
//     TaskSnapshot snapshot = await thumbnailUploadTask;
//     String thumbnailDownloadUrl = await snapshot.ref.getDownloadURL();
//     return thumbnailDownloadUrl;
//   }
//
//
//
//   /// save video information
//   saveVideoInformation (String videoPath) async {
//     try{
//
//       String videoId = DateTime.now().millisecondsSinceEpoch.toString();
//
//       //1. upload video to storage
//       var videoDownloadUrl = await uploadVideoFile(videoId, videoPath);
//
//       //2. upload video thumbnail to storage
//       var thumbnailDownloadUrl = await uploadVideoThumbnail(videoId, videoPath);
//
//     }catch(error){
//       Get.snackbar("Error", error.toString());
//     }
//   }
// }
