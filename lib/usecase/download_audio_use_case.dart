import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';



class DownloadAudioUseCase {
  Future<String?> execute(String id, String url) async {
    final Dio _dio = Dio();
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      final String localPath = '$appDocPath/$id.mp3';
      final File localFile = File(localPath);

      final bool fileExists = await localFile.exists();

      if (fileExists) {
        print('檔案已存在於本地：$localPath');
        return localPath;
      } else {
        print('檔案不存在，開始下載...');
        await _dio.download(url, localPath);
        print('下載完成：$localPath');
        return localPath;
      }
    } catch (e) {
      print('下載失敗: $e');
      return null;
    }
  }
}
