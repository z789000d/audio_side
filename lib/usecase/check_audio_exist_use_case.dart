import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class CheckAudioExistUseCase {
  Future<bool?> execute(String id) async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      final String localPath = '$appDocPath/$id.mp3';
      final File localFile = File(localPath);

      final bool fileExists = await localFile.exists();

      if (fileExists) {
        print('存在');
        return true;
      } else {
        print('不存在');
        return false;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
