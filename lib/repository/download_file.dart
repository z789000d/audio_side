import 'package:dio/dio.dart';

class DownloadFile {
  final Dio _dio = Dio();

  Future<void> download(String url, localPath) async {
    try {
      await _dio.download(url, localPath);
    } catch (e) {
      rethrow;
    }
  }
}
