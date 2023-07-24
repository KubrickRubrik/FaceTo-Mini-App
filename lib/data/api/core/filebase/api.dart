import 'dart:io';
import 'package:facetomini/core/config/entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

final class ApiFileServices {
  final String pathRoot = "/app_file";
  final String pathApp = "/app_file/app";
  final String pathSeries = "/app_file/series";

  // Checking if an image file exists in the device's file system
  Future<bool> checkExistFileImage({
    required TargetImageSource target,
    int? idSeries,
    int? idScene,
    int? idImage,
  }) async {
    if (!await getPermission()) return false;
    var documentDirectory = await getApplicationDocumentsDirectory();

    final filePath = switch (target) {
      TargetImageSource.app => "${documentDirectory.path}$pathApp/$idImage.webp",
      TargetImageSource.series => "${documentDirectory.path}$pathSeries/s_$idSeries/$idImage.webp",
      TargetImageSource.scenes => "${documentDirectory.path}$pathSeries/s_$idSeries/$idScene/$idImage.webp",
    };

    if (await File(filePath).exists()) {
      return true;
    } else {
      return false;
    }
  }

  // Obtaining permission to work with the file system
  Future<bool> getPermission() async {
    print("getPermission");
    if (await Permission.storage.status != PermissionStatus.granted) await Permission.storage.request();
    if (await Permission.storage.status != PermissionStatus.granted) {
      return false;
    } else {
      return true;
    }
  }
}
