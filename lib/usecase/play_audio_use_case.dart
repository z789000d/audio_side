import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PlayAudioUseCase {
  var isInit = false;

  Future<AudioPlayer> execute(AudioPlayer audioPlayer, String id) async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      final String localPath = '$appDocPath/$id.mp3';
      final File localFile = File(localPath);

      final bool fileExists = await localFile.exists();
      if (!isInit) {
        if (fileExists) {
          await audioPlayer.stop();
          await audioPlayer.play(DeviceFileSource(localPath));
          isInit = true;
        } else {
          print('不存在');
        }
      } else {
        audioPlayer.resume();
      }
      return audioPlayer;
    } catch (e) {
      print(e);
      return audioPlayer;
    }
  }
}
