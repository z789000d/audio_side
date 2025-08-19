import 'dart:io';

import 'package:audio_test/repository/download_file.dart';
import 'package:path_provider/path_provider.dart';



class DownloadAudioUseCase {
  var downloadFile = DownloadFile();
  Future<String?> execute(String id, String url) async {

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
        await downloadFile.download(url, localPath);
        print('下載完成：$localPath');
        return localPath;
      }
    } catch (e) {
      print('下載失敗: $e');
      return null;
    }
  }
}
