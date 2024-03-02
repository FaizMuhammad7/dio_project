import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';


class MyPermissionUtils {

  static Future<bool> askStoragePermission () async{
    var allowed = false;
    if (Platform.isIOS) {
      var status = await Permission.storage.request();
      allowed = status.isGranted;
    } else if (Platform.isAndroid){
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        /// use [Permissions.storage.status]
        var status = await Permission.storage.request();
        allowed = status.isGranted;
      }  else {
        /// use [Permissions.photos.status]
        var status = await Permission.photos.request();
        allowed = status.isGranted;
      }
    }
    return allowed;
  }
}